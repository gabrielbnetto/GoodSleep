import 'package:flutter/material.dart';
import 'package:good_sleep/pages/home/home_page.dart';
import 'package:good_sleep/pages/information/information_page.dart';

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
      body: InformationPage(),
    );
  }
}
