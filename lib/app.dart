import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'utils/constants.dart';
import 'screens/home_screen.dart';
import 'screens/scan_screen.dart';
import 'screens/url_result_screen.dart';
import 'screens/text_result_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Reader App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.system,
      initialRoute: Constants.homeRoute,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case Constants.homeRoute:
            return MaterialPageRoute(builder: (_) => const HomeScreen());
          case Constants.scanRoute:
            return MaterialPageRoute(builder: (_) => const ScanScreen());
          case Constants.urlResultRoute:
            final url = settings.arguments as String;
            return MaterialPageRoute(builder: (_) => UrlResultScreen(url: url));
          case Constants.textResultRoute:
            final data = settings.arguments as String;
            return MaterialPageRoute(
              builder: (_) => TextResultScreen(data: data),
            );
          default:
            return MaterialPageRoute(builder: (_) => const HomeScreen());
        }
      },
    );
  }
}
