import 'package:flutter/material.dart';
import 'package:whatsapp_new_ui/features/app/splash/splash_screen.dart';
import 'package:whatsapp_new_ui/features/app/theme/app_theme.dart';
import 'package:whatsapp_new_ui/routes/on_generate_routes.dart';
import 'main_injection_container.dart' as di;

Future<void> main() async {
  // await di.init();
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
