// ignore_for_file: deprecated_member_use

import 'package:demoproject/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MaterialApp(
    title: "Stateful Widget",
    home: const FavoriteCity(),
    debugShowCheckedModeBanner: newMethod,
  ));
}

bool get newMethod => false;

class FavoriteCity extends StatefulWidget {
  const FavoriteCity({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {
  String nameCity = "";
  final _items = ['English', 'Hindi', 'Bengali'];
  var _currentItemSelected = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stateful App Example"),
      ),
      body: Center(
        //margin: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //TextField(
            //onSubmitted: (String userInput) {
            //setState(() {
            //nameCity = userInput;
            //});
            //},
            //),

            const NewWidget(),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Please select your Language",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text(
                    "You can change the language",
                    style: TextStyle(fontSize: 10.0),
                  ),
                  Text(
                    "at any time",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10.0),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 200.0,
              child: DropdownButton<String>(
                items: _items.map((String dropdownStringitem) {
                  return DropdownMenuItem<String>(
                      value: dropdownStringitem,
                      child: Text(dropdownStringitem,
                          textAlign: TextAlign.center));
                }).toList(),
                onChanged: (String? newValueSelected) {
                  setState(() {
                    _currentItemSelected = newValueSelected!;
                  });
                },
                value: _currentItemSelected,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    width: 200.0,
                    child: RaisedButton(
                        child: const Text("Continue",
                            style: TextStyle(color: Colors.white)),
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondScreen()));
                        })))
            //Padding(
            //padding: const EdgeInsets.all(30.0),
            //child: Text(
            //"Your best city name is $nameCity",
            //style: const TextStyle(fontSize: 20.0),
            //),
            //)
          ],
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AddHomeImage();
  }
}

class AddHomeImage extends StatelessWidget {
  const AddHomeImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("images/home.png");
    Image image = Image(image: assetImage, width: 120.0, height: 120.0);
    return Container(
      child: image,
    );
  }
}
