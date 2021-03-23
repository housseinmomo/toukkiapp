import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class chargement extends StatefulWidget
{
  _chargement createState() => _chargement();
}

class _chargement extends State<chargement> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100, vertical: 100),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children: [
            Image.asset("images/logo.png"),

            SizedBox(height: 29,),

            SpinKitWave(
              color: Colors.blueGrey,
              size: 100,
            ),


          ],
        ),
      ),


    );
  }
}
