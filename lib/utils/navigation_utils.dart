import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationUtils {
  static Future<T?> navigateTo<T>(BuildContext context, Widget screen) {
    return Navigator.push<T>(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static Future<T?> navigateToAndReplace<T>(
    BuildContext context,
    Widget screen,
  ) {
    return Navigator.pushReplacement<T, T>(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  static void goBack(BuildContext context) {
    Navigator.pop(context);
  }

  static Future<void> openExternalUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw Exception('Could not launch $url');
    }
  }
}
