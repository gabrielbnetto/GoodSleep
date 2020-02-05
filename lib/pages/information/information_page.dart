import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:good_sleep/pages/home/home_page.dart';
import 'package:good_sleep/pages/login/sign_in.dart';
import 'package:good_sleep/shared/good_sleep_icons.dart';

class InformationPage extends StatelessWidget {

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
    return ListView(
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
          Stack(
            children: <Widget>[
              Image.asset('assets/images/cloud.png'),
              Positioned(
                top: 25,
                left: 20,
                child: Image.asset('assets/images/personSleeping.png'),
              )
            ]
          ),
          Container(
            padding: EdgeInsets.only(top: 50),
            child:Text('Bem vindo ao Good Sleep!', style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          Container(
              padding: EdgeInsets.only(left: 15, right: 5, top: 30),
                child:Row(
                  children: <Widget>[
                    Icon(Icons.check_box, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('O Good Sleep serve para ajudar você a \nmedir a qualidade do seu sono e monitorar \ntodas as possíveis variáveis.', style: TextStyle(fontSize: 15, color: Colors.white))
                  ]
                )
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 5, top: 30),
                child:Row(
                  children: <Widget>[
                    Icon(Icons.check_box, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Caso esteja com algum problema \nrelacionado ao seu sono, não deixe de \nprocurar um profissional para te ajudar!', style: TextStyle(fontSize: 15, color: Colors.white))
                  ]
                )
              ),
              Container(
                padding: EdgeInsets.only(left: 15, right: 5, top: 30),
                child:Row(
                  children: <Widget>[
                    Icon(Icons.check_box, color: Colors.orange),
                    SizedBox(width: 10),
                    Text('Todas as informações são aproximadas, \ndado que os sensores podem errar.', style: TextStyle(fontSize: 15, color: Colors.white))
                  ]
                )
              ),
          Container(
            padding: EdgeInsets.only(left: 15, right: 5, top: 30),
              child:Row(
              children: <Widget>[
                Icon(Icons.insert_emoticon, color: Colors.orange),
                SizedBox(width: 10),
                Text('Esperamos que você goste. Aproveite o App!', style: TextStyle(fontSize: 15, color: Colors.white))
              ]
            )
          ),] 
          )),
        InformationPageButton()
      ]
    );
  }
    
}

class InformationPageButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50, bottom: 10, left: 15, right: 15),
      width: 300,
      child:RaisedButton(
        color: Colors.orange,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/google_logo.png', width: 20),
            SizedBox(width: 10),
            Text("Entrar com o google", style: TextStyle(color: Colors.white, fontSize: 15)),
          ]
        ),
        shape: RoundedRectangleBorder( 
          borderRadius: new BorderRadius.circular(18.0),
        ),
        onPressed: () => {
          _openLoadingDialog(context, true),
          signInWithGoogle().then((value) {
          if(value != null){
            _openLoadingDialog(context, false);
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) {
                  return HomePage();
                },
              ),
              ModalRoute.withName('/home')
            );
          }else{
            _openLoadingDialog(context, false);
            _errorDialog(context);
          }
        })
        },
      )
    );
  }

  void _errorDialog(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(20.0)) ), 
          title: Center(child:Text("Erro ao entrar")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(child:Text("Ocorreu um erro ao tentar \nentrar com o Google, por favor, \ntente novamente!", textAlign: TextAlign.center,)),
              SizedBox(height: 10),
              RaisedButton(child:Text('OK!'), onPressed: (){Navigator.of(context).pop();})
            ]
          )
        );
      },
    );
  }
  
  void _openLoadingDialog(BuildContext context, bool loading) { 
    if(loading == true){
      showDialog( 
        barrierDismissible: false, 
        context: context, 
        builder:(_) => Material( 
          type: MaterialType.transparency,
          child: Center(child:
            SpinKitFadingCircle(color: Colors.blue, size: 50.0),
          )
        ) 
      );
    }else{
      Navigator.pop(context);
    }
  }

}