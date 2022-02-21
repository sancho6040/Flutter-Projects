import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); //constructor

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "Conversor de medidas", home: MyHomePage()); //return
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  //sintaxis flecha, nos ahorra usar return y {}
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double defaultPadding = 5.0;
  var units = {"m", "km", "g", "kg", "ft", "mi", "lb", "oz"};
  double _input = 0.0;
  String _unit1 = "m";
  String _unit2 = "m";
  double _resultado = 0.0;

  //metros, kilometros, grams, kilograms, feet, miles, pounds, ounces
  var meterUnit = [
    [1, 0.001, 0, 0, 3.28084, 0.00062, 0, 0], //[0][u2]
    [1000, 1, 0, 0, 3280.84, 0.62137, 0, 0], //[1][u2]
    [0, 0, 1, 0.001, 0, 0, 0.0022, 0.03527], //[2][u2]
    [0, 0, 1000, 1, 0, 0, 2.20462, 35.274], //[3][u2]
    [0.3048, 0.0003, 0, 0, 1, 0.00019, 0, 0], //[4][u2]
    [1609.34, 1.60934, 0, 0, 5282, 1, 0, 0], //[5][u2]
    [0, 0, 453.592, 0.45359, 0, 0, 1, 16], //[6][u2]
    [0, 0, 28.349, 0.02835, 0, 0, 0.0625, 1] //[7][u2]
  ];

  @override
  void initState() {
    _input = 0.0;
    _unit1 = "m";
    _unit2 = "m";
    _resultado = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("conversor de medidas"),
      ),
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(10.0)),
            const Text("Value"),
            TextField(
              keyboardType: TextInputType.number,
              // inputFormatters: <TextInputFormatter>[
              //   WhitelistingTextInputFormatter.digitsOnly
              // ],
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "ingrese un valor",
              ),
              onChanged: (text) {
                double val =
                    double.tryParse(text) ?? 0.0; //if text = null val = 0.0
                setState(() {
                  _input = val;
                });
              },
            ),
            const Text("From"),
            DropdownButton(
              value: _unit1,
              items: units.map((String value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) _unit1 = newValue;
                });
              },
            ),
            const Text("to"),
            DropdownButton(
              value: _unit2,
              items: units.map((String value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) _unit2 = newValue;
                });
              },
            ),
            Padding(padding: EdgeInsets.all(defaultPadding)),
            ElevatedButton(onPressed: calc, child: const Text("Calcular")),
            Padding(padding: EdgeInsets.all(defaultPadding)),
            Text('$_input $_unit1 equivale a  $_resultado $_unit2'),
          ],
        ),
      ),
    );
  }

  void calc() {
    int u1 = 0;
    int u2 = 0;

    switch (_unit1) {
      case "m":
        u1 = 0;
        break;
      case "km":
        u1 = 1;
        break;
      case "g":
        u1 = 2;
        break;
      case "kg":
        u1 = 3;
        break;
      case "ft":
        u1 = 4;
        break;
      case "mi":
        u1 = 5;
        break;
      case "lb":
        u1 = 6;
        break;
      case "oz":
        u1 = 7;
        break;
    }

    switch (_unit2) {
      case "m":
        u2 = 0;
        break;
      case "km":
        u2 = 1;
        break;
      case "g":
        u2 = 2;
        break;
      case "kg":
        u2 = 3;
        break;
      case "ft":
        u2 = 4;
        break;
      case "mi":
        u2 = 5;
        break;
      case "lb":
        u2 = 6;
        break;
      case "oz":
        u2 = 7;
        break;
    }

    print('u1: $u1 , u2: $u2 ');
    print(meterUnit[u1][u2]);

    setState(() {
      _resultado = _input * meterUnit[u1][u2];
    });
  }
}
