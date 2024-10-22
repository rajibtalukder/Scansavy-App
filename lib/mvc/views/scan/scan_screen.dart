import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../controllers/scan_controller.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScanController scanController = Get.put(ScanController());

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: scanController.qrKey, // Using controller's QR key
              onQRViewCreated: scanController.onQRViewCreated, // Pass QR view creation to controller
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Obx(() {
                final result = scanController.result.value;
                return result != null
                    ? Text(
                  'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}',
                )
                    : const Text('Scan a code');
              }),
            ),
          )
        ],
      ),
    );
  }
}
