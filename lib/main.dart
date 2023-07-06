/*
  NaXhioWallet - main.dart
  Version: 0.02
  The main entry point of the NaXhioWallet application is updated to use the NaXhioUI library.
  Created by NaXhio.Tech.
*/

// Import Flutter and Dart packages
import 'package:flutter/material.dart';
import 'naxhio_ui.dart'; // Import the custom NaXhioUI library

void main() {
  runApp(NaXhioWallet());
}

class NaXhioWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This is the root widget of the application.
    return MaterialApp(
      title: 'NaXhio Wallet',
      theme: NaXhioUI.themeData, // Use the theme data from the NaXhioUI library
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NaXhioUI.GlassyAppBar(
        // Use the GlassyAppBar from the NaXhioUI library
        title: 'Home Page',
      ),
      body: Center(
        child: NaXhioUI.GlassyButton(
          // Use the GlassyButton from the NaXhioUI library
          text: 'Welcome to NaXhio Wallet',
          onPressed:
              () {}, // Add a onPressed function as required by the GlassyButton
        ),
      ),
    );
  }
}
