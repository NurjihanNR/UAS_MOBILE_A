import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projek_uts/firebase_options.dart';
import 'package:projek_uts/login.dart';
import 'package:projek_uts/welcome_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 239, 200, 128)),
        useMaterial3: true,
      ),
      home: welcom(),
    );
  }
}
