import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';
import 'package:good_sleep/shared/http.dart';

class QualitySleepPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return new QualitySleepState();
  }

}

class QualitySleepState extends State<QualitySleepPage> {

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
    return FutureBuilder<dynamic>( 
      future: makeGetRequest(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        if( snapshot.connectionState == ConnectionState.waiting){ 
          return Center(child: SpinKitFadingCircle(color: Colors.blue, size: 50.0),); 
        }else if(snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
        }else{
          return ListView(children: <Widget>[Center(child: new Text('${snapshot.data}', style: TextStyle(color: Colors.white)))]);
        }
      }
    );
  }
}
