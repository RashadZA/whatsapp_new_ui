import 'package:flutter/material.dart';
import 'package:whatsapp_new_ui/features/app/splash/splash_screen.dart';
import 'package:whatsapp_new_ui/features/app/theme/app_theme.dart';
import 'package:whatsapp_new_ui/routes/on_generate_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appDarTheme,
      initialRoute: "/",
      onGenerateRoute: OnGenerateRoute.route,
      routes: {
        "/": (context) => const SplashScreen(),
      },
    );
  }
}
