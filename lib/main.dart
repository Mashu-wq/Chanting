import 'package:chanting/colors.dart';
import 'package:chanting/features/landing/screens/landing_screen.dart';
import 'package:chanting/firebase_options.dart';
import 'package:chanting/routes.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
      home: const LandingScreen(),
    );
  }
}
