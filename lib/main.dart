import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_new_ui/features/app/splash/splash_screen.dart';
import 'package:whatsapp_new_ui/features/app/theme/app_theme.dart';
import 'package:whatsapp_new_ui/features/user/presentation/cubit/auth/auth_cubit.dart';
import 'package:whatsapp_new_ui/features/user/presentation/cubit/credential/credential_cubit.dart';
import 'package:whatsapp_new_ui/features/user/presentation/cubit/get_device_number/get_device_number_cubit.dart';
import 'package:whatsapp_new_ui/features/user/presentation/cubit/get_single_user/get_single_user_cubit.dart';
import 'package:whatsapp_new_ui/features/user/presentation/cubit/user/user_cubit.dart';
import 'package:whatsapp_new_ui/routes/on_generate_routes.dart';
import 'main_injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (context) => di.sl<CredentialCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetSingleUserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<UserCubit>(),
        ),
        BlocProvider(
          create: (context) => di.sl<GetDeviceNumberCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: appDarTheme,
        initialRoute: "/",
        onGenerateRoute: OnGenerateRoute.route,
        routes: {
          "/": (context) => const SplashScreen(),
        },
      ),
    );
  }
}
