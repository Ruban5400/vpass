import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../controller/appointment_controller.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: MobileScannerController(
            returnImage: true, detectionSpeed: DetectionSpeed.noDuplicates),
        onDetect: (capture) {
          final List<Barcode> barcodes = capture.barcodes;
          // final Uint8List? image = capture.image;
          for (final barcode in barcodes) {
            if (barcode.rawValue != null) {
              if (barcode.rawValue!.toString().contains("pre-registered")) {
                Get.find<AppointmentController>().qrcodeScan(
                    true,
                    barcode.rawValue!.split("/").last.toString(),
                    'pre-registered');
              } else if (barcode.rawValue
                  .toString()
                  .contains("visitor-details")) {
                Get.find<AppointmentController>().qrcodeScan(
                    true,
                    barcode.rawValue!.split("/").last.toString(),
                    'visitor-details');
              }

              Get.back();
            }
          }
        },
      ),
    );
  }
}
