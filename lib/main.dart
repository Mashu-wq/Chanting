import 'package:chanting/colors.dart';
import 'package:chanting/common/widgets/error.dart';
import 'package:chanting/common/widgets/loader.dart';
import 'package:chanting/features/auth/controller/auth_controller.dart';
import 'package:chanting/features/landing/screens/landing_screen.dart';
import 'package:chanting/firebase_options.dart';
import 'package:chanting/routes.dart';
import 'package:chanting/screens/mobile_screen_layout.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp UI',
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            useMaterial3: true,
            appBarTheme: const AppBarTheme(
              color: appBarColor,
            )),
        onGenerateRoute: (settings) => generateRoute(settings),
        home: ref.watch(userDataAuthprovider).when(
              data: (user) {
                if (user == null) {
                  return const LandingScreen();
                }
                return const MobileLayoutScreen();
              },
              error: (error, trace) {
                return ErrorScreen(error: error.toString());
              },
              loading: () => const Loader(),
            ));
  }
}
