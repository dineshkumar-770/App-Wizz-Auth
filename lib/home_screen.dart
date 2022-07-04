import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/sp2.png'),fit: BoxFit.fill)
        ),
        child: Center(child: Text('The Home Screen where the Content is Displayed', textAlign: TextAlign.center, style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 25, color: Colors.amber)),)),
      ),
    ),
   );
  }
}