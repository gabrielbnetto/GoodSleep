import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:good_sleep/pages/detalhes/quality_sleep_page.dart';
import 'package:good_sleep/pages/information/information_page.dart';
import 'package:good_sleep/pages/login/sign_in.dart';
import 'package:good_sleep/shared/charts/time_sleep_chart.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';

class HomePage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }

}

class HomePageState extends State<HomePage>{
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            tooltip: 'Sair',
            color: Colors.white,
            onPressed: () {
              _logoutDialog(context);
            }
          )
        ]
        // elevation: 0.0, 
      ),
      body: _construirHome(),
      backgroundColor: Color(0xff13172b),
    );
  }

  void _logoutDialog(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(20.0)) ), 
          title: Center(child:Text("Sair")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(child:Text("Tem certeza que deseja sair?", textAlign: TextAlign.center,)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RaisedButton(child:Text('Continuar'), onPressed: (){
                    Navigator.of(context).pop();
                  }),
                  RaisedButton(child:Text('Sair'), onPressed: (){
                    signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context){
                          return InformationPage();
                        }
                      ),
                      ModalRoute.withName('/information')
                    );
                  }),
                ]
              )
            ]
          )
        );
      },
    );
  }

  Widget _construirHome() {
    return ListView(
        children: <Widget>[
          _construirWelcomeText(),
          makeChartHome(context),
          _construirRowCards(),
          _construirSleepQualityGraph()
        ]
    );
  }

  Widget _construirWelcomeText() {
    return Container(
      padding: EdgeInsets.only(top: 15, left: 35),
      alignment: Alignment.center,
      child: SizedBox(
      width: 250.0,
      child: TypewriterAnimatedTextKit(
        text: [
          'Bem vindo $name!',
        ],
        textStyle: TextStyle(
            fontSize: 18.0,
            fontFamily: "Agne",
            color: Colors.white
        ),
        textAlign: TextAlign.start,
        alignment: AlignmentDirectional.topStart // or Alignment.topLeft
      ),
    )
    );
  }

  Widget _construirRowCards() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _construirCardHearth(150),
        _construirCard(8.3)
      ]
    );
  }

  Widget _construirCardHearth(hr) {
    return  Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xff232d37),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border.all(color: Colors.white, width: 1)
      ),
      margin: EdgeInsets.only(left: 15),
      padding: EdgeInsets.only(top: 5),
      child: Column(
        children: <Widget>[
          Icon(GoodSleep.heartbeat, size: 90, color: Colors.redAccent),
          Text('$hr Avg Hearth Rate', style: TextStyle(color: Colors.white)),
          Text('Média de batimentos cardíacos',style: TextStyle(color: Colors.grey, fontSize: 12), textAlign: TextAlign.center)
        ]
      )
      // )
    );
  }

  Widget _construirCard(ts) {
    return  Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xff232d37),
        borderRadius: const BorderRadius.all(
          Radius.circular(18),
        ),
        border: Border.all(color: Colors.white, width: 1)
      ),
      margin: EdgeInsets.only(top:20, right: 15, bottom: 20),
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

  //COR DA BARRA
  final Color barBackgroundColor = const Color(0xff232d37);
  int touchedIndex;

  Widget _construirSleepQualityGraph() {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 10, right: 10),
          child:AspectRatio(
            aspectRatio: 1,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              color: const Color(0xff232d37),
              // color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(18),
                      ),
                      border: Border.all(color: Colors.white)
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            'Qualidade do sono',
                            style: TextStyle(
                                color: Colors.grey, fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            'Aproximado',
                            style: TextStyle(
                                color: Colors.grey, fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: BarChart(
                                mainBarData(),
                                swapAnimationDuration: Duration(milliseconds: 250),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ),
        Positioned(
          right:10,
          top: 5,
          child:SizedBox(
          width: 90,
          height: 34,
          child: FlatButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => QualitySleepPage()));
            },
            child: Text(
              'Mais',
              style: TextStyle(
                  fontSize: 12, color: Colors.white),
            )
            )
          )
        )
      ]
    );
  }


  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          color: isTouched ? Color(0xff007555) : barColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 15,
            color: Color(0xff314152),
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }
  ///VALORES DO GRAFICO
  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, 5, isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(1, 6.5, isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(2, 5, isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(3, 7.5, isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(4, 9, isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(5, 11.5, isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(6, 6.5, isTouched: i == touchedIndex);
          default:
            return null;
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Segunda';
                  break;
                case 1:
                  weekDay = 'Terça';
                  break;
                case 2:
                  weekDay = 'Quarta';
                  break;
                case 3:
                  weekDay = 'Quinta';
                  break;
                case 4:
                  weekDay = 'Sexta';
                  break;
                case 5:
                  weekDay = 'Sabado';
                  break;
                case 6:
                  weekDay = 'Domingo';
                  break;
              }
              return BarTooltipItem(
                  weekDay + '\n' + (rod.y - 1).toString(), TextStyle(color: Colors.white));
            }),
        touchCallback: (barTouchResponse) {
          setState(() {
            if (barTouchResponse.spot != null &&
                barTouchResponse.touchInput is! FlPanEnd &&
                barTouchResponse.touchInput is! FlLongPressEnd) {
              touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
            } else {
              touchedIndex = -1;
            }
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          margin: 16,
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
        leftTitles: const SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }
  
}