import 'package:flutter/material.dart';
import '../theme/components.dart';
import '../widgets/m3_elevated_button.dart';
import '../utils/navigation_utils.dart';
import '../utils/constants.dart';
import 'scan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const M3AppBar(title: 'Inicio'),
      body: Center(
        child: M3ElevatedButton(
          label: Constants.readQrButtonLabel,
          icon: const Icon(Icons.qr_code_scanner_sharp),
          onPressed: () {
            NavigationUtils.navigateTo(context, const ScanScreen());
          },
        ),
      ),
    );
  }
}
