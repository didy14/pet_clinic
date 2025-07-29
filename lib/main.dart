import 'package:flutter/material.dart';
import 'package:user_login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:user_login/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Login',
      home: LoginPage(),
    );
  }
}
