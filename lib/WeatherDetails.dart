import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherDetails extends StatefulWidget {

  String city=" ";

  WeatherDetails(this.city);

  @override
  _WeatherDetailsState createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends State<WeatherDetails> {

  var weatherData ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData(widget.city);
  }

  getData(city){
    print("getting weather data hey !!!");
    String url = "http://api.openweathermap.org/data/2.5/forecast?q=$city&appid=90fc2ca6abdc52f1d10b5a95791c76f1";
    http.get(url).then((response) {
      print(response.body);
      setState(() {
        this.weatherData=json.decode(response.body);
      });
    }).catchError((onError){
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> listData ;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather of ${widget.city}"),
      ),
      body:  (this.weatherData==null) ?
      Center(
        child: CircularProgressIndicator(),
      )
          :
          ListView.builder(
              itemCount: (this.weatherData==null) ? 0 : this.weatherData['list'].length,
              itemBuilder: (context,index){
                return Card(
                  color: Colors.deepOrange,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      CircleAvatar(
                       // child: ,
                     //  backgroundImage: AssetImage("images/clouds.png"),
                        backgroundImage: AssetImage("images/${weatherData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                      ),
                      Text(
                        "date : ${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatherData['list'][index]['dt']*1000000))}"
                      ),
                      Text("${(weatherData['list'][index]['main']['temp'] / 10).round()} °C", style: TextStyle(fontSize: 25),)
                    ],
                  ),
                );
              })
    );
  }
}
