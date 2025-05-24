import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import '../theme/components.dart';
import '../services/qr_service.dart';
import '../utils/navigation_utils.dart';
import 'url_result_screen.dart';
import 'text_result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  final QrService _qrService = QrService();
  bool _cameraInitialized = false;
  String? _error;

  @override
  void reassemble() {
    super.reassemble();
    if (_cameraInitialized) {
      _qrService.pauseScanning();
      _qrService.resumeScanning();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _qrService.dispose();
    super.dispose();
  }

  void _onScanned(String code) {
    final uri = Uri.tryParse(code);
    if (uri != null &&
        uri.isAbsolute &&
        (uri.scheme == 'http' || uri.scheme == 'https')) {
      NavigationUtils.navigateTo(context, UrlResultScreen(url: code));
    } else {
      NavigationUtils.navigateTo(context, TextResultScreen(data: code));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const M3AppBar(title: 'Escanear QR'),
      body: Stack(
        children: [
          QRView(
            key: _qrService.qrKey,
            onQRViewCreated: (controller) {
              _qrService.onQRViewCreated(controller, (code) {
                _onScanned(code);
              });
              setState(() {
                _cameraInitialized = true;
              });
            },
            overlay: QrScannerOverlayShape(
              borderColor: Theme.of(context).colorScheme.secondary,
              borderRadius: 12,
              borderLength: 30,
              borderWidth: 8,
              cutOutSize: MediaQuery.of(context).size.width * 0.8,
            ),
          ),
          if (_error != null)
            Center(
              child: Text(
                _error!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _qrService.resumeScanning();
        },
        tooltip: 'Reiniciar escaneo',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
