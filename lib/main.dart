// ignore_for_file: avoid_print

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//
import 'package:todo/view/Add.dart';
import 'package:todo/view/HealthCare.dart';
import 'package:todo/view/Login.dart';
// import 'package:todo/view/MapScreen.dart';
import 'package:todo/view/MyHomePage.dart';
// import 'package:todo/view/Notif.dart';
import 'package:todo/view/PageeView.dart';
import 'package:todo/view/SignIn.dart';
import 'package:todo/view/location.dart';
// import 'package:todo/view/HealthCare.dart';
// import 'package:todo/view/side_menu.dart';
// import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: "AIzaSyBQI5JOfvxjT6PN-cIR4e9HzJIbLhm2JNM",
            appId: "1:95192147737:android:fcdf3c93673c8c6a050788",
            messagingSenderId: "95192147737",
            projectId: "todo-70f6e",
            storageBucket: "todo-70f6e.appspot.com",
          ),
        )
      : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('======================User is currently signed out!');
      } else {
        print('======================User is signed in!');
      }
    });
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Pageeview(),
      routes: {
        "Pageeview": (context) => const Pageeview(),
        "HealthCare": (context) => const HealthCare(),
        "Login": (context) => const Login(),
        "SignIn": (context) => const SignIn(),
        "Add": (context) => const Add(),
        "MyHomePage": (context) => const MyHomePage(
              title: 'hhhh',
            ),
        "MapScreen": (context) => MapSample(),
      },
    );
  }
}
