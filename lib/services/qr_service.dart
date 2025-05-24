import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class QrService {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;

  void onQRViewCreated(
    QRViewController controller,
    void Function(String) onScanned,
  ) {
    _controller = controller;

    if (Platform.isAndroid) {
      controller.pauseCamera();
      controller.resumeCamera();
    }

    controller.scannedDataStream.listen((scanData) {
      final code = scanData.code ?? '';
      if (code.isNotEmpty) {
        onScanned(code);
        controller.pauseCamera();
      }
    });
  }

  void resumeScanning() {
    _controller?.resumeCamera();
  }

  void pauseScanning() {
    _controller?.pauseCamera();
  }

  void dispose() {
    _controller?.dispose();
  }
}
