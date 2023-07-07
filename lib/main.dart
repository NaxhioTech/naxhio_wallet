// ignore_for_file: library_private_types_in_public_api, avoid_init_to_null

/*
  NaXhioWallet - main.dart
  Version: 0.05
  Implemented basic account creation wizard and step 1 (entering account name and password).
  Created by NaXhio.Tech.
*/

// Import Flutter and Dart packages
import 'package:flutter/material.dart';
import 'dart:async'; // Needed for asynchronous operations
import 'naxhio_ui.dart'; // Import the custom NaXhioUI library

void main() {
  runApp(NaXhioWallet());
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
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => AccountCreationScreen()));
    } else {
      // If keys are found, navigate to HomePage
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const GlassyVideoBackground(
          videoSource: 'assets/videos/background_video.mp4',
        ),
        Center(
          child: Image.asset(
            'assets/pictures/logo_transparent.png', // Replace with your actual logo file path
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

class AccountCreationScreen extends StatefulWidget {
  const AccountCreationScreen({super.key});

  @override
  _AccountCreationScreenState createState() => _AccountCreationScreenState();
}

class _AccountCreationScreenState extends State<AccountCreationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _accountName = "Account 1";
  String _password = "";

  void _nextStep() {
    // Function to handle the next step
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Navigate to the next step, for now, let's go back to HomePage
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NaXhioUI.GlassyAppBar(title: 'Create Account - Step 1'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _accountName,
                decoration: const InputDecoration(
                  labelText: 'Account Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name for your account.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _accountName = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password for your account.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _nextStep,
                child: const Text('Next Step'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
