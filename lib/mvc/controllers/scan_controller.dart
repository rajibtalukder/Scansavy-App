import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var result = Rxn<Barcode>(); // Reactive nullable type
  QRViewController? qrController;

  Future<void> launchUrlFun(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      result.value = scanData; // Update result using reactive variable
      launchUrlFun(scanData.code.toString());
    });
  }

  @override
  void onClose() {
    qrController?.dispose(); // Dispose the QR controller
    super.onClose();
  }
}
