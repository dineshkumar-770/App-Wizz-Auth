import 'package:flutter/material.dart';
import 'package:flutter_auth_app/obscreen1.dart';
import 'package:flutter_auth_app/obscreen2.dart';
import 'package:flutter_auth_app/obscreen3.dart';

class OnboardScreen1 extends StatefulWidget {
  const OnboardScreen1({Key? key}) : super(key: key);

  @override
  State<OnboardScreen1> createState() => _OnboardScreen1State();
}

class _OnboardScreen1State extends State<OnboardScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: const [
        ObScreen1(),
        ObScreen2(),
        ObScreen3(),
      ],
    ));
  }
}
