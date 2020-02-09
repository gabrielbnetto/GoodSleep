import 'package:flutter/material.dart';
import 'package:good_sleep/pages/home/home_page.dart';
import 'package:good_sleep/pages/information/information_page.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      routes: {
        "/home": (_) => new HomePage(), 
        "/information": (_) => new InformationPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(GoodSleep.bed, size:30, color: Colors.white) 
            ),
            Text('Good Sleep', style: TextStyle(fontSize: 25, color: Colors.white))
          ]
        ),
        backgroundColor: Color(0xff13172b),
        // elevation: 0.0, 
      ),
      body: new SplashScreen(
        seconds: 10,
        navigateAfterSeconds: new InformationPage(),
        title: new Text('Bem vindo ao Good Sleep',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.white
        )),
        image: new Image.asset('assets/images/splashScreen.png'),
        backgroundColor: Color(0xff13172b),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.orange
      )
    );
  }
}
