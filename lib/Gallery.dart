import 'package:firstApp/GalleryDetails.dart';
import 'package:flutter/material.dart';
import './WeatherDetails.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  String keyWord = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Gallery"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (value){
              setState(() {
                this.keyWord = value;
              });
            },
            onSubmitted: (value){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDetails(this.keyWord)));
            },
          ),
          RaisedButton(
            child: Text("submit"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>GalleryDetails(this.keyWord)));
            },
          ),
        ],
      ),
    );
  }
}
