// ignore_for_file: deprecated_member_use, duplicate_ignore
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:flutter_auth_app/googl3_signin.dart';
import 'package:flutter_auth_app/home_screen.dart';
import 'package:provider/provider.dart';
import 'obscreen3.dart';
import 'package:google_fonts/google_fonts.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class OtpScreen extends StatefulWidget {

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

      Future nextScreen() async{
         await Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ObScreen3();
        }));
      }

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  late String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if(authCredential.user != null){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ObScreen3()));
      }

    // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          ?.showSnackBar(SnackBar(content: Text('Invalid OTP')));
    }
  }

  getMobileFormWidget(context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: height * 0.4,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 275),
          child: Text('Login', style: TextStyle(color: Colors.white60, fontSize: 20),),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.color,
              color: Colors.white54,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Theme(
                data: ThemeData(
                  primarySwatch: Colors.teal,
                primaryColor: Color(0xffB27E29),
                ),
                child: TextField(
                  style: TextStyle(color: Color(0xffB27E29),fontSize: 20),
                  textAlignVertical: TextAlignVertical.bottom,
                  textAlign: TextAlign.start,
                  cursorHeight: 25,
                  maxLines: 2,
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Color(0xff0F261E ))),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.circular(50)),
                    isDense: true,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('+91',style: TextStyle(color: Color(0xffB27E29).withOpacity(0.7),fontSize: 20)),
                    ),
                    hintText: "Enter 10 digit mobile number",
                    hintStyle: TextStyle(color: Color(0xffB27E29).withOpacity(0.2),fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: height * 0.075,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF1D459),
            shape: StadiumBorder(),
          ),
          onPressed: () async {
            setState(() {
              showLoading = true;
            });

            await _auth.verifyPhoneNumber(
              phoneNumber: '+91${phoneController.text}',
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed)async {
                setState(() {
                  showLoading = false;
                });
                // ignore: deprecated_member_use
                _scaffoldKey.currentState?.showSnackBar(
                    SnackBar(content: Text('Invalid Phone Number')));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(child: Text("GET  OTP", style: TextStyle(fontSize: 20, color: Colors.black),)),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/bottombar.png'))
          ),
          child: Center(child: Text('Or', style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.white60, fontSize: 25)),)),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/facebook.png'),fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            TextButton(
              onPressed: () {
                final provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                provider.signup(context);
              },
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/google.png')),
                  borderRadius: BorderRadius.circular(30)
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.4,),
        Padding(
          padding: const EdgeInsets.only(left: 8,right: 8),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              backgroundBlendMode: BlendMode.color,
              color: Colors.white54,
              borderRadius: BorderRadius.circular(50)
            ),
            child: Center(
              child: Theme(
                data: ThemeData(
                  primarySwatch: Colors.teal,
                primaryColor: Color(0xffB27E29),
                ),
                child: TextField(
                  style: TextStyle(color: Color(0xffB27E29),fontSize: 20),
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.start,
                  cursorHeight: 25,
                  maxLines: 2,
                  keyboardType: TextInputType.number,
                  controller: otpController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(50), borderSide: BorderSide(color: Color(0xff0F261E ))),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 5),
                      borderRadius: BorderRadius.circular(50)),
                    isDense: true,
                    hintText: "Enter your 6 digit OTP",
                    hintStyle: TextStyle(color: Color(0xffB27E29).withOpacity(0.2),fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        TextButton(
          onPressed: (){
            setState(() {
              
            });
            getOtpFormWidget(context);
          },
          child: Text('Did\'nt Got Code? Resend', style: TextStyle(color: Color(0xff9C4D58), fontSize: 15),)),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xffF1D459),
            shape: StadiumBorder(),
          ),
          onPressed: () async {
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId, smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.7,
            child: Center(child: Text("VERIFY", style: TextStyle(fontSize: 20, color: Colors.black),)),
          ),
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        key: _scaffoldKey,
        body: Stack(
          children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/loginscreen.png'),fit: BoxFit.fill,),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, bottom: 400),
            child: Image.asset('assets/images/sp1.png'),
          ),
        ),
        Container(
          child: showLoading
              ? Center(
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: 50,
                        width: 50,
                        color: Colors.transparent,
                        child: Center(child: CircularProgressIndicator(color: Color(0xffF1D459),))),
                    )),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ),
        ]
      )
    );
  }
}