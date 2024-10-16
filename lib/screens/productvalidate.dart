import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hardware_store/widgets/appbar_widget.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ProductValidateScreen extends StatefulWidget {
  const ProductValidateScreen({super.key});

  @override
  State<ProductValidateScreen> createState() => _ProductValidateScreenState();
}

class _ProductValidateScreenState extends State<ProductValidateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: Text('Product Validate'),
        showBackArrow: true,
      ),
      body: MobileScanner(
        // qr code scan
        controller:
            MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates,returnImage: true),
        onDetect: (capture) {
          // read barcodes
          final List<Barcode> barcodes = capture.barcodes;
          // to access image 
          final Uint8List ? image = capture.image;

          for(final barcode in barcodes){
            print('barcode found! ${barcode.rawValue}');

          }
          if(image != null){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text(
                  barcodes.first.rawValue ?? "",
                ),
                content: Image(image: 
                MemoryImage(image)),
              );
            });
          }
        },
      ),
    );
  }
}
