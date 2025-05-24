import 'package:flutter/material.dart';
import '../theme/components.dart';
import '../widgets/m3_elevated_button.dart';
import '../utils/navigation_utils.dart';

class TextResultScreen extends StatelessWidget {
  final String data;

  const TextResultScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const M3AppBar(title: 'Contenido QR'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            M3Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SelectableText(
                  data,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const SizedBox(height: 24),
            M3ElevatedButton(
              label: 'Escanear de nuevo',
              onPressed: () => NavigationUtils.goBack(context),
            ),
          ],
        ),
      ),
    );
  }
}
