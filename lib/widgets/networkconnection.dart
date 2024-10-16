import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnection extends StatefulWidget {
  const NetworkConnection({super.key});

  @override
  _NetworkConnectionState createState() => _NetworkConnectionState();
}

class _NetworkConnectionState extends State<NetworkConnection> {
  // check connection
  late StreamSubscription<ConnectivityResult> _subscription;
  late Timer _timer;
  bool _isDeviceConnected = false;
  bool _isAlertSet = false;

// intial state
  @override
  void initState() {
    super.initState();
    _checkInitialConnectivity();
    
  }

  void _checkInitialConnectivity() async {
    // check network connection
    _isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (!_isDeviceConnected) {
      _showDialogBox();
      setState(() => _isAlertSet = true);
      _startConnectivityTimer();
    }

    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result)  async {
      _isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (_isDeviceConnected) {
        setState(() => _isAlertSet = false);
        _timer.cancel(); // Stop the timer when connected
      } else if (!_isAlertSet) {
        _showDialogBox();
        setState(() => _isAlertSet = true);
        _startConnectivityTimer();
      }
    });
  }

// connection timmer
  void _startConnectivityTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) async {
      _isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!_isDeviceConnected && !_isAlertSet) {
        _showDialogBox();
        setState(() => _isAlertSet = true);
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); 
  }

// dialog box
  void _showDialogBox() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No Internet Connection'),
        content: const Text('Please check your internet connection'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              setState(() => _isAlertSet = false);
              _isDeviceConnected = await InternetConnectionChecker().hasConnection;
              if (!_isDeviceConnected) {
                _startConnectivityTimer();
                setState(() => _isAlertSet = true);
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
