// ignore_for_file: prefer_const_constructors

import 'package:demoproject/thirdpage.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext contxt) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Please Enter Your Mobile Number",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                "Ypu'll receive a 4 digit code\n to verify next.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 10.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: SizedBox(
                width: 200.0,
                child: TextField(
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Mobile Number'),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(15),
                child: SizedBox(
                    width: 200.0,
                    child: RaisedButton(
                        color: Colors.blue,
                        child: Text("Continue", 
                        style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,),),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (contxt) => ThirdPage()));
                        })))
          ],
        ),
      ),
    );
  }
}
