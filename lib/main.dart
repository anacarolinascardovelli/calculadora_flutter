import 'package:flutter/material.dart';
import 'package:projeto_teste/calculator.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(home: new Splash(),));
}

class Splash extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new MyApp(),
      title: new Text('Iniciando a calculadora',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Calculator',
        fontSize: 40.0
      ),),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.blue[300]
    );
  }
}

void ma() => runApp(Splash());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}
