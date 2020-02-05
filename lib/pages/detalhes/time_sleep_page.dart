import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';

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
    return ListView(
      children: <Widget>[
        _construirSleepDaysGraph(),
        _construirRowCards(),
        _construirChartWake()
      ]
    );
  }

  Widget _construirSleepDaysGraph(){
      return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      child:Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.70,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(18),
                  ),
                  border: Border.all(color: Colors.white, width: 1),
                  color: const Color(0xff232d37)),
              child: Padding(
                padding: const EdgeInsets.only(right: 22.0, left: 8.0, top: 24, bottom: 12),
                child: LineChart(
                  mainData()
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter, 
            child:Padding(
              padding: EdgeInsets.only(top: 5),
              child:Text('Dormindo', 
                style: TextStyle(color: Colors.grey, fontSize: 15)
              )
            )
          )
        ],
      )
    );
  }

  LineChartData mainData() {
    List<Color> gradientColors = [
      const Color(0xff23b6e6),
      const Color(0xff02d39a),
    ];
    
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle:
              TextStyle(color: const Color(0xff68737d), fontWeight: FontWeight.bold, fontSize: 14),
          getTitles: (value) {
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
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: const Color(0xff67727d),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '5h';
              case 3:
                return '7h';
              case 5:
                return '9h';
            }
            return '';
          },
          reservedSize: 28,
          margin: 10,
        ),
      ),
      borderData:
          FlBorderData(show: true, border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 9,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 3),
            FlSpot(4, 4),
            FlSpot(5, 3),
            FlSpot(6, 4)
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }

  Widget _construirRowCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _construirCardWakeUpHours(150),
        _construirCard(8.3)
      ]
    );
  }

  Widget _construirCardWakeUpHours(hr) {
    return  Container(
      width: 165,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xff232d37),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border.all(color: Colors.white, width: 1)
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Icon(GoodSleep.heartbeat, size: 90, color: Colors.redAccent),
          Text('$hr Tempo acordado', style: TextStyle(color: Colors.white)),
          Text('Média do tempo que \npassou acordado',style: TextStyle(color: Colors.grey, fontSize: 12), textAlign: TextAlign.center)
        ]
      )
      // )
    );
  }

  Widget _construirCard(ts) {
    return  Container(
      width: 165,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xff232d37),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border.all(color: Colors.white, width: 1)
      ),
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(top: 10),
      child: Column(
        children: <Widget>[
          Icon(GoodSleep.moon_inv, size: 90, color: Colors.white),
          Text('$ts Avg Sleep', style: TextStyle(color: Colors.white)),
          Text('Média de horas de sono',style: TextStyle(color: Colors.grey, fontSize: 13), textAlign: TextAlign.center)
        ]
      )
      // )
    );
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