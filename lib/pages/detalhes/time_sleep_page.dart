import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:good_sleep/shared/charts/time_sleep_chart.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';
import 'package:good_sleep/shared/http.dart';

class TimeSleepPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TimeSleepState();
  }
}

class TimeSleepState extends State<TimeSleepPage> {

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
      body: _construirPageDetailChart(),
      backgroundColor: Color(0xff13172b),
    );
  }

  _construirPageDetailChart() {
    return FutureBuilder<dynamic>( 
      future: makeGetRequest(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
        if( snapshot.connectionState == ConnectionState.waiting){ 
          return Center(child: SpinKitFadingCircle(color: Colors.blue, size: 50.0)); 
        }else if(snapshot.data == false) {
          return ListView(
            children: <Widget>[
              makeChartWithNoData(),
              _construirChartWake()
            ]
          );
        }else{
          return ListView(
            children: <Widget>[
              _construirSleepDaysGraph(),
              _construirChartWake()
            ]
          );
        }
      }
    );
  }

  Widget _construirSleepDaysGraph(){
    return makeChartTimeSleep();
  }

  Widget _construirChartWake() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.7,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(18),
                ),
                border: Border.all(color: Colors.white, width: 1),
                color: const Color(0xff232d37)
              ),
              child:Card(
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                color: const Color(0xff232d37),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 20,
                    barTouchData: BarTouchData(
                      enabled: false,
                      touchTooltipData: BarTouchTooltipData(
                        tooltipBgColor: Colors.transparent,
                        tooltipPadding: const EdgeInsets.all(0),
                        tooltipBottomMargin: 8,
                        getTooltipItem: (
                          BarChartGroupData group,
                          int groupIndex,
                          BarChartRodData rod,
                          int rodIndex,
                        ) {
                          return BarTooltipItem(
                            rod.y.round().toString(),
                            TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: SideTitles(
                        showTitles: true,
                        textStyle: TextStyle(
                            color: const Color(0xff7589a2), fontWeight: FontWeight.bold, fontSize: 14),
                        margin: 20,
                        getTitles: (double value) {
                          switch (value.toInt()) {
                            case 0:
                              return 'Seg';
                            case 1:
                              return 'Ter';
                            case 2:
                              return 'Qua';
                            case 3:
                              return 'Qui';
                            case 4:
                              return 'Sex';
                            case 5:
                              return 'Sab';
                            case 6:
                              return 'Dom';
                            default:
                              return '';
                          }
                        },
                      ),
                      leftTitles: const SideTitles(showTitles: false),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: [
                      BarChartGroupData(
                          x: 0,
                          barRods: [BarChartRodData(y: 8, color: Colors.lightBlueAccent)],
                          showingTooltipIndicators: [0]),
                      BarChartGroupData(
                          x: 1,
                          barRods: [BarChartRodData(y: 10, color: Colors.lightBlueAccent)],
                          showingTooltipIndicators: [0]),
                      BarChartGroupData(
                          x: 2,
                          barRods: [BarChartRodData(y: 14, color: Colors.lightBlueAccent)],
                          showingTooltipIndicators: [0]),
                      BarChartGroupData(
                          x: 3,
                          barRods: [BarChartRodData(y: 13, color: Colors.lightBlueAccent)],
                          showingTooltipIndicators: [0]),
                      BarChartGroupData(
                          x: 3,
                          barRods: [BarChartRodData(y: 13, color: Colors.lightBlueAccent)],
                          showingTooltipIndicators: [0]),
                      BarChartGroupData(
                          x: 3,
                          barRods: [BarChartRodData(y: 10, color: Colors.lightBlueAccent)],
                          showingTooltipIndicators: [0]),
                    ],
                  ),
                ),
              ),
            )
          ),
          Align(
            alignment: Alignment.topCenter, 
            child:Padding(
              padding: EdgeInsets.only(top: 5),
              child:Text('Tempo acordado', 
                style: TextStyle(color: Colors.grey, fontSize: 15)
              )
            )
          )
        ]
      )
    );
  }
}