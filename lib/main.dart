import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String _output = "0";
  String operand = "";

  operation(String btntxt) {
    if (btntxt == 'C') {
      _output = "0";

      num2 = 0.0;
      num1 = 0.0;
      operand = "";
    } else if (btntxt == '+' ||
        btntxt == '-' ||
        btntxt == 'X' ||
        btntxt == '/') {
      num1 = double.parse(output);
      operand = btntxt;
      _output = '0';
    } else if (btntxt == '=') {
      num2 = double.parse(output);

      if (operand == '+') {
        _output = (num1 + num2).toString();
      }
      if (operand == '-') {
        _output = (num1 - num2).toString();
      }
      if (operand == 'X') {
        _output = (num1 * num2).toString();
      }
      if (operand == '/') {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + btntxt;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget Button(String btntxt) {
    return Expanded(
      child: RawMaterialButton(
        shape: Border.all(color: Colors.orangeAccent, width: 3),
        fillColor: Colors.white12,
        padding: EdgeInsets.all(23),
        splashColor: Colors.orangeAccent,
        child: Text(
          '$btntxt',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
        ),
        onPressed: () {
          operation(btntxt);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic Calculator",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.calculate,
            color: Colors.black,
          ),
          title: Text(
            "Basic Calc",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Container(
          margin: EdgeInsets.only(top: 200),
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.orangeAccent, width: 4),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('$output',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.all(20),
                ),
              ),
              Row(
                children: [
                  Button('9'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('8'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('7'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('+'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Button('6'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('5'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('4'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('-'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Button('3'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('2'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('1'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('X'),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Button('0'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('C'),
                  SizedBox(
                    width: 5,
                  ),
                  Button('='),
                  SizedBox(
                    width: 5,
                  ),
                  Button('/'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
