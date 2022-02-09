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
  var units = {"M", "Km", "g", "Kg", "ft", "Mi", "lb", "Oz."};
  double _input = 0.0;
  String _unit1 = "";
  String _unit2 = "";
  double _resultado = 0.0;

  @override
  void initState() {
    _input = 0.0;
    _unit1 = "";
    _unit2 = "";
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
              items: units.map((String value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) _unit1 = newValue;
                });
              },
              // value: _unit1,
            ),
            const Text("to"),
            DropdownButton(
              items: units.map((String value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) _unit2 = newValue;
                });
              },
              // value: _unit2,
            ),
            Padding(padding: EdgeInsets.all(defaultPadding)),
            ElevatedButton(onPressed: calc, child: const Text("Calcular")),
            Padding(padding: EdgeInsets.all(defaultPadding)),
            Text('$_input $_unit1 = $_resultado $_unit2'),
          ],
        ),
      ),
    );
  }

  void calc() {
    setState(() {
      _resultado = _input * 10;
    });
  }
}
