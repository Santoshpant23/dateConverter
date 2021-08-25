import 'package:date_convert/policy.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class drawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(25),
          color: Colors.orangeAccent,
          child: Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("images/avatar.jpg"))),
                  //child: Image.asset("images/avatar.jpg" , ),
                ),
                SizedBox(height: 10),
                Text("Santosh Pant",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Email : pantsantosh23@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
       
        
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text(
            "Privacy Policy",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Policy()));
          },
        ),
        ListTile(
          leading: Icon(Icons.star),
          title: Text(
            "Rate Us",
            style: TextStyle(fontSize: 20),
          ),
          onTap: _launchURL
        ),
        ListTile(
          leading: Icon(Icons.more),
          title: Text(
            "More From Us",
            style: TextStyle(fontSize: 20),
          ),
          onTap: () async {
            const url = 'https://google.com/';
            await launch(url);
          },
        ),
      ],
    ));
  }
}

void _launchURL() async =>
    await canLaunch('https://google.com/') ? await launch('https://google.com/') : throw 'Could not launch https://google.com/';