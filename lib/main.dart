import 'package:flutter/material.dart';
import 'package:zi_core/zi_core_io.dart';
import 'app_shell/app_shell_io.dart';

void main() {
  ziCoreInit(beta: true);
  ZiColors.override(
    ZiColorOverrides(
      primary: const Color(0xFFF97316),
      // secondary: const Color(0xFF55FFFF),
      // tertiary: const Color(0xFF55FF55),
    ),
  );
  AppConfig.environment = ZiEnvironment.production;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ZiToKit zi_6',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ZiColors.primary),
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: ZiSplashScreen(),
    );
  }
}
