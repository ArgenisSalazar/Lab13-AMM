import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:universal_platform/universal_platform.dart';
import 'material_login_screen.dart';
import 'cupertino_login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    if (UniversalPlatform.isAndroid) {
      debugPrint("Android");
      return const MaterialApp(
        title: 'Material Login',
        home: MaterialLoginScreen(),
      );
    } else {
      debugPrint("Web u otra plataforma");
      return const CupertinoApp(
        title: 'Cupertino Login',
        home: CupertinoLoginScreen(),
      );
    }
  }
}
