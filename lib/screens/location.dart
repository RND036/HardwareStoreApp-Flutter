

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  // To get real-time location
  final Location _locationController = Location();

  // Location of the store
  static const LatLng _techHardware =
      LatLng(7.298204866976855, 80.6294623956333);
  static const LatLng _techHardwareSec =
      LatLng(6.949764113761071, 79.85635361706916);

  LatLng? _currentLocation;

  // Google Maps controller to move the camera
  GoogleMapController? _mapController;

  Map<PolylineId,Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    getLocationUpdate().then((_)=>{getPolylinePoints().then((coordinates)=>generatePolyLineFromPoints(coordinates))});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Adding Google Maps
      body: _currentLocation == null
          ? const Center(
              child:CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: _techHardware,
                zoom: 13,
              ),
              markers: {
                const Marker(
                    markerId: MarkerId("_SourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _techHardware),
                const Marker(
                    markerId: MarkerId("_SecondaryLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: _techHardwareSec),
                Marker(
                  markerId: const MarkerId("_UserLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: _currentLocation!,
                )
              },
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
    );
  }

  // To get real-time location
  Future<void> getLocationUpdate() async {
    // Checking that allows to get user location
    bool serviceEnabled;
    // To check that the permission is granted by the user
    PermissionStatus permissionGranted;

    // Check if location services are enabled
    serviceEnabled = await _locationController.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
      if (!serviceEnabled) {
        // Location services are not enabled
        return;
      }
    }

    // Checking if the permission is granted by the user
    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      // Requesting location permission from the user
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Permission not granted
        return;
      }
    }

    // Listen to changes in the user's location
    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          // Updating the current location
          _currentLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
          // Move the camera to the user's location
          _mapController?.animateCamera(
            CameraUpdate.newLatLng(_currentLocation!),
          );
        });
      }
    });
  }
  // for polylines
  Future<List<LatLng>> getPolylinePoints() async{
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(googleApiKey:"AIzaSyBsezEQCkmue4MR4gp_Jc2usQ7QlklipEU" ,request: PolylineRequest(origin:    PointLatLng(_techHardware.latitude,_techHardware.longitude),destination:  PointLatLng(_techHardwareSec.latitude,_techHardwareSec.longitude),mode:TravelMode.driving));
    // for the result of the polylines
    if (result.points.isNotEmpty) {
     for (var point in result.points) {
      polylineCoordinates.add(LatLng(point.latitude, point.longitude));
    }
  }else{
    print(result.errorMessage);
  }

  return polylineCoordinates;
}
//for generate polylines
void generatePolyLineFromPoints(List<LatLng> polylineCoordinates) async{
  PolylineId id = const PolylineId('poly');
  Polyline polyline = Polyline(polylineId: id,color: Colors.red,points: polylineCoordinates,width: 8);
  setState(() {
    polylines[id] = polyline;
  });
}
}
