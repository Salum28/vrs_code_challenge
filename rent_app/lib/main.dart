import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rent_app/routing/routes.dart';
import 'package:rent_app/ui/core/themes/dark_theme.dart';
import 'package:rent_app/ui/core/themes/light_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Rent App",
      theme: LightTheme.lightTheme,
      darkTheme: DarkTheme.darkTheme,
      routerConfig: router,
    )
  );
}
