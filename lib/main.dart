import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itravel/authService.dart';
import 'package:itravel/home_screen.dart';

import 'login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Itinerary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthService().getCurrentUser() == null
          ? LoginScreen()
          : HomeScreen(),
    );
  }
}