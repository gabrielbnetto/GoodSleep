import 'package:flutter/material.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';


class QualitySleepPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          mainAxisSize: MainAxisSize.min,
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
    return Container();
  }
}