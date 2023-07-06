// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

/*
  NaXhioWallet - main.dart
  Version: 0.03
  Added a splash screen with a background video and logo image. 
  The app checks for existing public/private keys and navigates to the account creation or home screen accordingly.
  Created by NaXhio.Tech.
*/

// Import Flutter and Dart packages
import 'package:flutter/material.dart';
import 'dart:async'; // Needed for asynchronous operations
import 'naxhio_ui.dart'; // Import the custom NaXhioUI library

void main() {
  runApp(const NaXhioWallet());
}

class NaXhioWallet extends StatelessWidget {
  const NaXhioWallet({super.key});

  @override
  Widget build(BuildContext context) {
    // This is the root widget of the application.
    return MaterialApp(
      title: 'NaXhio Wallet',
      theme: NaXhioUI.themeData, // Use the theme data from the NaXhioUI library
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkKeys();
  }

  void _checkKeys() async {
    // Function to check if public/private keys exist

    // Get the public/private keys from a secure storage (this is a placeholder for now)
    // Replace this with actual code to get keys from secure storage
    var keys = null;

    await Future.delayed(const Duration(seconds: 3)); // Wait for 3 seconds

    if (keys == null) {
      // If keys are not found, navigate to AccountCreationScreen
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => const AccountCreationScreen()));
    } else {
      // If keys are found, navigate to HomePage
      const Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GlassyVideoBackground(
          videoSource: 'assets/background_video.mp4',
        ),
        Center(
          child: Image.asset(
            'assets/logo_transparent.png', // Replace with your actual logo file path
            width: MediaQuery.of(context).size.width *
                0.5, // Logo size is 50% of screen width
          ),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
  // Rest of the code as before
  // ...
}

class AccountCreationScreen extends StatelessWidget {
  const AccountCreationScreen({super.key});

  // You can replace this placeholder with the actual implementation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NaXhioUI.GlassyAppBar(title: 'Create Account'),
      body: const Center(child: Text('Account Creation Screen')),
    );
  }
}
