import 'package:flutter/material.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';

class TimeSleepPage extends StatelessWidget {

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
      body: _construirDetalheChart(),
      backgroundColor: Color(0xff13172b),
    );
  }

  _construirDetalheChart() {

  }
}
