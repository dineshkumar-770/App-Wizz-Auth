import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'otp.dart';

class ObScreen3 extends StatefulWidget {
  const ObScreen3({Key? key}) : super(key: key);

  @override
  State<ObScreen3> createState() => _ObScreen3State();
}

class _ObScreen3State extends State<ObScreen3> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                child: Text(
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
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/obbthree.png'),
                    fit: BoxFit.fill)),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height * 0.5,
              ),
              Text(
                'We give assurance for 100%\n Purity of your digital gold',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25, color: Colors.white, wordSpacing: 3),
              ),
              SizedBox(
                width: width * 0.15,
                child: Image.asset('assets/images/obs3.png'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return OtpScreen();
                  }));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color(0xffF1D459), shape: StadiumBorder()),
                child: Container(
                  height: height / 10,
                  width: width * 0.7,
                  decoration: BoxDecoration(
                      color: Color(0xffF1D459),
                      borderRadius: BorderRadius.circular(50)),
                  child: Center(
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
