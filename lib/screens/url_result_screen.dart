import 'package:flutter/material.dart';
import '../theme/components.dart';
import '../widgets/m3_elevated_button.dart';
import '../utils/navigation_utils.dart';

class UrlResultScreen extends StatefulWidget {
  final String url;

  const UrlResultScreen({super.key, required this.url});

  @override
  State<UrlResultScreen> createState() => _UrlResultScreenState();
}

class _UrlResultScreenState extends State<UrlResultScreen> {
  bool _launched = false;

  @override
  void initState() {
    super.initState();
    _openUrl();
  }

  Future<void> _openUrl() async {
    try {
      await NavigationUtils.openExternalUrl(widget.url);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al abrir el navegador.')),
      );
    } finally {
      setState(() {
        _launched = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const M3AppBar(title: 'URL detectada'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'URL escaneada:',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            SelectableText(
              widget.url,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            M3ElevatedButton(
              label: _launched ? 'Abrir nuevamente' : 'Abrir en navegador',
              onPressed: () => NavigationUtils.openExternalUrl(widget.url),
            ),
            const SizedBox(height: 12),
            M3ElevatedButton(
              label: 'Volver',
              onPressed: () => NavigationUtils.goBack(context),
            ),
          ],
        ),
      ),
    );
  }
}
