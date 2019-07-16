import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter QR',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Bar Code Scanner"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: MaterialButton(
              child: Text("Scan QR code"),
              onPressed: () => scanQrCode(),
            ),
          ),

          Text(code,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

  scanQrCode() async {
    try{
      final result = await BarcodeScanner.scan();

      setState(() {
        code = result;
      });
    }catch(e){
      print(e);
    }
  }

}
