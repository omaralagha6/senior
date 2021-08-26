// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senior_project/screens/create_newaaccount.dart';
import 'package:senior_project/screens/forgot_password.dart';
import 'package:senior_project/screens/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Money Extraction Serial Number',
      theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginScreen(),
    );
  }
}
