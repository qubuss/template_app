import 'package:flutter/material.dart';
import 'package:inspector/inspector.dart';
import 'package:templateapp/configs/navigation/go_router_config.dart';
import 'package:templateapp/localization/generated/l10n.dart';
import 'package:templateapp/localization/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Localization.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Template App',
      routerConfig: GoRouterConfig().router,
      builder: (context, child) => Inspector(child: child!),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        I10n.delegate,
      ],
    );
  }
}
