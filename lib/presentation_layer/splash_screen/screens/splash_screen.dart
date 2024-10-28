import 'dart:async';
import 'package:Islami/core/utils/assets.dart';
import 'package:Islami/presentation_layer/onboarding/screens/onboarding.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Function(Locale) setLocale;

  const SplashScreen({required this.setLocale, Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set the timer to navigate after 1 second
    Timer(const Duration(seconds: 1), () {
      // Navigate with animation after 1 second
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => OnboardingScreen(setLocale: widget.setLocale),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Define the fade-in transition
        const begin = 0.0;
        const end = 1.0;
        const curve = Curves.easeInOut;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var fadeAnimation = animation.drive(tween);

        return FadeTransition(
          opacity: fadeAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 500), // Duration of the animation
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            ImageAssets.background,
            height: MediaQuery.of(context).size.height * 1.0,
            width: MediaQuery.of(context).size.width * 1.0,
            fit: BoxFit.fill,
          ),
          Positioned(
            child: Image.asset(ImageAssets.glow),
            top: 0,
            right: 10,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Positioned(
            child: Image.asset(ImageAssets.Mosque),
            top: 60,
            right: 70,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.67,
          ),
          Positioned(
            child: Image.asset(ImageAssets.shape_left),
            top: 215,
            left: 0,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Positioned(
            child: Image.asset(ImageAssets.shape_right),
            bottom: 215,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Center(
                child: Image.asset(
                  ImageAssets.object,
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              const SizedBox(height: 20),
              Center(child: Image.asset(ImageAssets.islami)),
              const Spacer(flex: 2),
              Center(
                child: Image.asset(
                  ImageAssets.routegold,
                  height: 80,
                  width: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
