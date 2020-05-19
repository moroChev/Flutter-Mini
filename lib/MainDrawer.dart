import 'package:firstApp/Weather.dart';
import 'package:flutter/material.dart';
import './Quiz.dart';
import './Weather.dart';
import './Gallery.dart';
import './Camera.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Mohcine Rouessi"),
            accountEmail: Text("rouessi.mohcine@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("images/mohcine.jpg"),
            ),
          ),
          ListTile(
            title: new Text("Gallery"),
            leading: new Icon(Icons.inbox),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Gallery()));
            },
          ),
          Divider(
            height: 0.1,
          ),
          ListTile(
            title: new Text("Weather"),
            leading: new Icon(Icons.people),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Weather()));
            },
          ),
          ListTile(
            title: new Text("Quiz"),
            leading: new Icon(Icons.local_offer),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Quiz()));
            },
          ),
          ListTile(
            title: Text("Camera"),
            leading: Icon(Icons.camera_alt),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Camera() ));
            },
          )
        ],
      ),
    );
  }
}
