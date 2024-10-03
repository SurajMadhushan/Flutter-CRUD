import 'package:flutter/material.dart';
import 'dart:async'; // For timer

import './ui/screens/homeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen Demo',
      theme: ThemeData(
        primaryColor: Colors.green[800],
        scaffoldBackgroundColor: Colors.green[50],
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set the splash screen timer to 3 seconds and navigate to the home screen
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Placeholder for your logo or image
            Icon(
              Icons.eco,
              size: 100,
              color: Colors.green[400], // Green icon
            ),
            SizedBox(height: 20),
            Text(
              'My Professional App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[500], // Darker green text
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.green[50], // Light green background
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.green[400], // Green AppBar
      ),
      body: Center(
        child: Text(
          'Welcome to the home screen!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
