import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/otp.dart';

class ObScreen2 extends StatefulWidget {
  const ObScreen2({Key? key}) : super(key: key);

  @override
  State<ObScreen2> createState() => _ObScreen2State();
}

class _ObScreen2State extends State<ObScreen2> {
  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Center(
              child: Padding(
            padding: const EdgeInsets.only(right: 16, top: 16),
            child: TextButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return OtpScreen();
                  }));
                },
                child: const Text(
                  'Skip',
                  style: TextStyle(fontSize: 22, color: Color(0xffB27E29)),
                )),
          ))
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/obbtwo.png'),
                    fit: BoxFit.fill)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: Height * 0.5,
              ),
              const Text(
                'Buy/Sell high quality 99.99% 24K digital gold',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25, color: Colors.white, wordSpacing: 3),
              ),
              SizedBox(
                width: Width * 0.15,
                child: Image.asset('assets/images/obs2.png'),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffF1D459), shape: const StadiumBorder()),
                child: Container(
                  height: Height / 10,
                  width: Width * 0.7,
                  decoration: BoxDecoration(
                      color: Color(0xffF1D459),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Center(
                      child: Text(
                    'NEXT',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
