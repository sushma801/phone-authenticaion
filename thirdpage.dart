// ignore_for_file: prefer_const_constructors
import 'package:demoproject/secondpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:demoproject/forthpage.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'dart:async';
class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
    late String _verificationCode;
    final TextEditingController _pinPutController = TextEditingController();
    final FocusNode _pinPutFocusNode = FocusNode();
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: const Color.fromRGBO(43, 46, 66, 1),
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: const Color.fromRGBO(126, 203, 224, 1),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Third page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: PinPut(
                  fieldsCount: 6,
                  withCursor: true,
                  textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
                  eachFieldWidth: 40.0,
                  eachFieldHeight: 55.0,
                  focusNode: _pinPutFocusNode,
                  controller: _pinPutController,
                  submittedFieldDecoration: pinPutDecoration,
                  selectedFieldDecoration: pinPutDecoration,
                  followingFieldDecoration: pinPutDecoration,
                  pinAnimationType: PinAnimationType.fade,
                  onSubmit: (pin) async{
                    try{
                      await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode, smsCode: pin))
                        .then((value) async{
                            if(value.user !=null){
                              Navigator.pushAndRemoveUntil(
                                context, 
                                MaterialPageRoute(builder: (context)=>FourthPage()), 
                                (route) => false);
                            }
                        });
                    }
                    catch(e){
                      FocusScope.of(context).unfocus();
                      _scaffoldkey.currentState
                      // ignore: deprecated_member_use
                      ?.showSnackBar(SnackBar(content: Text('invalid OTP')));
                    }
                  }

                ),
              )
            ,
            SizedBox(height: 100.0,),
            SizedBox(
                width: 200.0,
                child: NewWidget())
          ],
        ),
      ),
    );
  }

  _verifyPhone() async => await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91{widget.phone}',
       verificationCompleted:  (PhoneAuthCredential credential) async {
         await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                  (route) => false);
            }
          });
       }, 
       verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        }, 
       codeSent:  (String verificationID, int ?resendToken){
         setState(() {
           _verificationCode=verificationID;
         });
       },
       codeAutoRetrievalTimeout:(verificationId) {
         setState(() {
           _verificationCode = verificationId;
         });
       },
       timeout: Duration(seconds: 60));
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.blue,
        child:
            Text("Verify", style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => FourthPage()));
        });
  }
}
