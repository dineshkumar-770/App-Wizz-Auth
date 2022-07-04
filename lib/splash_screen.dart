import 'package:flutter/material.dart';
import 'package:flutter_auth_app/onboard_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //navigate();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sp2.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Image.asset('assets/images/sp1.png'),
          ),
        ),
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        splashIconSize: double.infinity,
        nextScreen: OnboardScreen1());
  }
}
