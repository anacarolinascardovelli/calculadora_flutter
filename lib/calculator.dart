import 'package:flutter/material.dart';
import 'package:projeto_teste/memory.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:share/share.dart';
 
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}
 
class _CalculatorState extends State<Calculator> {
  final memory = Memory();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: new Text(
          'Calculadora',
          style: TextStyle(color: Colors.blue[300]),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.share),
            onPressed: (() {
              Share.share('Para mais informações sobre Flutter, acesse https://flutter.dev/');
            }),
          ),
        ],
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
            title: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        )),
      ),
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildHistoryDisplay(),
          _buildDisplay(),
          Divider(
            height: 0.2,
          ),
          _buildKeyboard(),
        ],
      ),
    );
  }

  _buildDisplay() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 10, right: 10),
        color: Colors.black,
        child: AutoSizeText(
          memory.result,
          style: TextStyle(
            fontSize: 80,
            fontFamily: 'RobotoMono',
            color: Colors.white,
          ),
          textAlign: TextAlign.end,
          maxLines: 1,
        ),
      ),
    );
  }

  _buildHistoryDisplay() {
    return Container(
      padding: EdgeInsets.only(top: 30, right: 10),
      color: Colors.black,
      child: Text(
        memory.history,
        style: TextStyle(
          fontSize: 20,
          fontFamily: 'RobotoMono',
          color: Colors.white,
        ),
        textAlign: TextAlign.end,
        maxLines: 1,
      ),
    );
  }

  _buildKeyboardButton(String label,
      {int flex = 1, Color textColor = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        color: Colors.black,
        textColor: textColor,
        child: Text(label, style: TextStyle(fontSize: 24)),
        onPressed: () {
          setState(() {
            memory.applyCommand(label);
          });
        },
      ),
    );
  }

  _buildKeyboard() {
    return Container(
      height: 400,
      color: Colors.black,
      child: Column(children: <Widget>[
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildKeyboardButton('AC', textColor: Colors.blue[300]),
            _buildKeyboardButton('DEL', textColor: Colors.blue[300]),
            _buildKeyboardButton('%', textColor: Colors.blue[300]),
            _buildKeyboardButton('/', textColor: Colors.blue[300]),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildKeyboardButton('9'),
            _buildKeyboardButton('8'),
            _buildKeyboardButton('7'),
            _buildKeyboardButton('X', textColor: Colors.blue[300]),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildKeyboardButton('6'),
            _buildKeyboardButton('5'),
            _buildKeyboardButton('4'),
            _buildKeyboardButton('+', textColor: Colors.blue[300]),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildKeyboardButton('3'),
            _buildKeyboardButton('2'),
            _buildKeyboardButton('1'),
            _buildKeyboardButton('-', textColor: Colors.blue[300]),
          ],
        )),
        Expanded(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildKeyboardButton('0', flex: 2),
            _buildKeyboardButton('.'),
            _buildKeyboardButton('=', textColor: Colors.blue[300]),
          ],
        )),
      ]),
    );
  }
}
