import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QuizPage(),
  ));
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int a = Random().nextInt(100);
  int b = Random().nextInt(100);
  int score = 0;
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(
            'MathWiz',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$a + $b =',
                style: TextStyle(fontSize: 40, color: Colors.blue),
              ),
              Container(
                height: 40,
                width: 60,
                // margin: EdgeInsets.all(6),
                child: TextFormField(
                  decoration: new InputDecoration(
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                    ),
                  ),
                  controller: myController,
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          FlatButton(
            child: Text('CHECK'),
            color: Colors.green,
            onPressed: () {
              int value = a + b;
              String sum = "$value";
              if (sum == myController.text) {
                score = score + 10;
              } else {
                score = score - 5;
              }
              a = Random().nextInt(100);
              b = Random().nextInt(100);
              myController.text = '';
              setState(() {});
            },
          ),
          FlatButton(
            child: Text('SKIP'),
            color: Colors.blue,
            onPressed: () {
              a = Random().nextInt(100);
              b = Random().nextInt(100);
              myController.text = '';
              setState(() {});
            },
          ),
          Text('Score: $score',
              style: TextStyle(fontSize: 30, color: Colors.green)),
        ],
      ),
    );
  }
}
