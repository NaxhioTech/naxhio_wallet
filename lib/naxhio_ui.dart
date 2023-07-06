// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// NaXhioUI - A Flutter UI package that provides a set of highly customizable, glassmorphic design inspired widgets.
///
/// This UI package offers a unique set of widgets including buttons, containers, text fields, app bars, and a background video widget, all following a similar design language.
///
/// Author: NaXhio.Tech
/// Last updated: Jully 2023
///
class NaXhioUI {
  // Define the theme data for the UI library.
  // This allows for consistency in colors and styles across the widgets.
  static ThemeData themeData = ThemeData(
    primaryColor: const Color(0xFF0F52BA), // Sapphire blue
    primaryColorLight: const Color(0xFF4682B4), // Steel blue
  );

  // GlassyButton widget
  // This is a text button with a semi-transparent background and customizable text.
  // The button's styles and functionality can be modified with the parameters.
  static Widget GlassyButton({
    required String text,
    VoidCallback? onPressed,
    double borderRadius = 5.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(12.0),
    TextStyle textStyle = const TextStyle(fontSize: 16, color: Colors.white),
    List<Color> borderGradientColors = const [
      Colors.blue,
      Colors.blueAccent,
    ],
    double borderWidth = 2.0,
    Color splashColor =
        Colors.white24, // Add splashColor for visual feedback on tap
    double splashRadius = 10.0, // Custom splash radius
  }) {
    return Container(
      decoration: _getGlassyDecoration(borderRadius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          splashColor: splashColor, // Set the splash color
          splashFactory: InkSplash.splashFactory,
          child: CustomPaint(
            painter: _GradientPainter(
              borderRadius: borderRadius,
              gradient: LinearGradient(colors: borderGradientColors),
              strokeWidth: borderWidth,
            ),
            child: Container(
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  width: borderWidth,
                  color: Colors.transparent,
                ),
                boxShadow: _getBoxShadow(),
              ),
              child: Center(
                child: Text(
                  text,
                  style: textStyle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static List<BoxShadow> _getBoxShadow() {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 4,
        blurRadius: 5,
        offset: const Offset(0, 3),
      ),
    ];
  }

  // GlassyIconButton widget
  // This is an icon button where the icon color can be customized.
  static Widget GlassyIconButton({
    required IconData icon,
    VoidCallback? onPressed,
    Color color = Colors.white,
    double borderRadius = 10.0,
  }) {
    return Container(
      decoration: _getGlassyDecoration(borderRadius),
      child: IconButton(
        icon: Icon(icon, color: color),
        onPressed: onPressed,
      ),
    );
  }

  // GlassyContainer widget
  // This is a container with a glassmorphic design.
  // The child widget will be displayed with a blurred, semi-transparent background.
  static Widget GlassyContainer({
    required Widget child,
    double borderRadius = 10.0,
  }) {
    return Container(
      decoration: _getGlassyDecoration(borderRadius),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Apply blur effect
          child: child,
        ),
      ),
    );
  }

// GlassyTextField widget
// This is a text field with a semi-transparent background.
// The input text and hint text colors can be customized.
  static Widget GlassyTextField({
    TextEditingController? controller,
    String? hint,
    TextInputType keyboardType = TextInputType.text,
    double borderRadius = 10.0,
    TextStyle style = const TextStyle(color: Color(0xFF0F52BA)),
    BorderSide borderSide = BorderSide.none,
  }) {
    return CustomPaint(
      painter: _GradientPainter(
        strokeWidth: 2,
        borderRadius: borderRadius,
        gradient:
            const LinearGradient(colors: [Colors.white70, Colors.white10]),
      ),
      child: Container(
        decoration: BoxDecoration(
          color:
              Colors.white.withOpacity(0.3), // Add semi-transparent background
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: _getBoxShadow(),
        ),
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: style,
          decoration: InputDecoration(
            filled: false,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.symmetric(
                vertical: 5.0), // Set vertical padding
            hintText: hint,
            hintStyle: TextStyle(color: themeData.primaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: borderSide,
            ),
          ),
        ),
      ),
    );
  }

  // GlassyAppBar widget
  // This is an app bar with a glassmorphic design.
  // The title and action buttons can be customized.
  static PreferredSizeWidget GlassyAppBar({
    required String title,
    List<Widget>? actions,
    double elevation = 0.0,
    TextStyle textStyle = const TextStyle(color: Color(0xFF0F52BA)),
    IconThemeData iconThemeData = const IconThemeData(color: Color(0xFF0F52BA)),
  }) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: elevation,
      title: Text(title, style: textStyle),
      actions: actions,
      iconTheme: iconThemeData,
    );
  }

  // Helper function to get the glassy decoration
  static BoxDecoration _getGlassyDecoration(double borderRadius) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: themeData.primaryColor.withOpacity(0.3),
      boxShadow: [
        BoxShadow(
          color: themeData.primaryColor.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 15,
          offset: const Offset(0, 3),
        ),
      ],
    );
  }
}

// GlassyVideoBackground widget
// This widget plays a looped video as the background for a page or part of a page.
// The video source file should be provided.
class GlassyVideoBackground extends StatefulWidget {
  final String videoSource;
  final double opacity;
  final Color backgroundColor;

  const GlassyVideoBackground({
    super.key,
    required this.videoSource,
    this.opacity = 0.0,
    this.backgroundColor = Colors.transparent,
  });

  @override
  _GlassyVideoBackgroundState createState() => _GlassyVideoBackgroundState();
}

class _GlassyVideoBackgroundState extends State<GlassyVideoBackground> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoSource)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
          _controller.setLooping(true); // Loop the video
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: _controller.value.size.width,
              height: _controller.value.size.height,
              child: VideoPlayer(_controller),
            ),
          ),
        ),
        Container(
          color: widget.backgroundColor.withOpacity(widget.opacity),
        ),
      ],
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint;
  final double _borderRadius;

  _GradientPainter(
      {required Gradient gradient,
      required double borderRadius,
      required double strokeWidth})
      : _borderRadius = borderRadius,
        _paint = Paint()
          ..shader = gradient
              .createShader(Rect.fromLTWH(0, 0, strokeWidth, strokeWidth))
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    var outerRect = Rect.fromLTWH(0, 0, size.width, size.height);
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(_borderRadius));
    canvas.drawRRect(outerRRect, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
