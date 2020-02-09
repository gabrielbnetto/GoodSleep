import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:good_sleep/pages/detalhes/time_sleep_page.dart';
import 'package:page_transition/page_transition.dart';

makeChartHome(BuildContext context) {
    List<double> data = [5.0, 7.0, 8.0, 6.0, 7.0, 4.0, 8,0];

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
                padding: const EdgeInsets.only(right: 30.0, left: 8.0, top: 24, bottom: 12),
                child: LineChart(
                  mainData(data)
                ),
              ),
            ),
          ),
          Positioned(
            left: -15,
            child:SizedBox(
            width: 90,
            height: 34,
            child: FlatButton(
              onPressed: () {
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeftWithFade, child: TimeSleepPage()));
              },
              child: Text(
                'Mais',
                style: TextStyle(
                    fontSize: 12, color: Colors.white),
              )
              )
            )
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

makeChartTimeSleep() {
  List<double> data = [5.0, 7.0, 8.0, 6.0, 7.0, 4.0, 8,0];
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
                  mainData(data)
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

makeChartWithNoData() {
  List<double> data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0,0];
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
                  mainData(data)
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
          ),
          Align(
            alignment: Alignment.topCenter, 
            child:Padding(
              padding: EdgeInsets.only(top: 75),
              child:Text('Sem dados', 
                style: TextStyle(color: Colors.grey, fontSize: 15)
              )
            )
          )
        ],
      )
    );
}


LineChartData mainData(List<double> data) {
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
      maxY: 15,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, data[0]),
            FlSpot(1, data[1]),
            FlSpot(2, data[2]),
            FlSpot(3, data[3]),
            FlSpot(4, data[4]),
            FlSpot(5, data[5]),
            FlSpot(6, data[6])
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

