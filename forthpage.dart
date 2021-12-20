import 'package:demoproject/fifthpage.dart';
import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({Key? key}) : super(key: key);

  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  String _value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fourth Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Radio(
                  value: 'Shipper',
                  groupValue: _value,
                  onChanged: (String? value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
                AddShipperImage(),
                SizedBox(width: 20.0),
                Text("Shipper")
              ],
            ),
            SizedBox(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 'Transport',
                  groupValue: _value,
                  onChanged: (String? value) {
                    setState(() {
                      _value = value!;
                    });
                  },
                ),
                AddTransportImage(),
                SizedBox(width: 20.0),
                Text("Transport")
              ],
            ),
            SizedBox(height: 15.0,),
            RaisedButton(
              color: Colors.blue,
                child: const Text(
                  "Continue",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FifthPage()));
                })
          ],
        ),
      ),
    );
  }
}

class AddShipperImage extends StatelessWidget {
  const AddShipperImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage1 = AssetImage("images/shipper.png");
    Image image1 = Image(
      image: assetImage1,
      width: 60.0,
      height: 60.0,
    );
    return Container(
      child: image1,
    );
  }
}

class AddTransportImage extends StatelessWidget {
  const AddTransportImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage2 = AssetImage("images/transport.png");
    Image image2 = Image(
      image: assetImage2,
      width: 50.0,
      height: 50.0,
    );
    return Container(
      child: image2,
    );
  }
}
