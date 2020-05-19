import 'package:firstApp/WeatherDetails.dart';
import 'package:flutter/material.dart';
import './WeatherDetails.dart';

class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String city = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Weather in $city"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "tapez une ville"),
            style: TextStyle(fontSize: 25),
            onChanged: (value) {
              setState(() {
                this.city = value;
                print(value);
              });
            },
            onSubmitted: (value) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WeatherDetails(this.city)));

            },
          ),
          RaisedButton(
            child: Text("submit"),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WeatherDetails(this.city)));
            },
          )
        ],
      ),
    );
  }
}
