import 'package:flutter/material.dart';
import 'package:http/http.dart';


Future makeGetRequest(context) async {
  try{
    String url = 'https://jsonplaceholder.typicode.com/posts';
    Response response = await get(url);

    int statusCode = response.statusCode;
    String json = response.body;

    print(statusCode);
    // print(json);
    return json;
  }catch(err){
    print(err);
    _errorDialog(context);
    return false;
  }
}

void _errorDialog(context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(20.0)) ), 
          title: Center(child:Text("Erro")),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(child:Text("Ocorreu um erro ao tentar carregar os dados.", textAlign: TextAlign.center,)),
              SizedBox(height: 10),
              RaisedButton(child:Text('OK!'), onPressed: (){Navigator.of(context).pop();})
            ]
          )
        );
      },
    );
  }
