import 'package:flutter/material.dart';

/*void main() {
  runApp(const MyApp());
}*/

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
  String _username = "";
  String _fruit = "";
  String _message = "";
  var fruits = {"orange", "apple", "Banna", "StawBerry"};

  @override
  void initState() {
    _username = "";
    _fruit = "";
    _message = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de medidas"),
      ),
      body: Center(
        child: Column(
          children: [
            TextField(onChanged: (text) {
              var conversion = text.toUpperCase();
              setState(() {
                _username = conversion;
              });
            }),
            Text(_username),
            DropdownButton(
              items: fruits.map((String value) {
                return DropdownMenuItem(child: Text(value), value: value);
              }).toList(),
              onChanged: (String? newValue) {
                setState(
                  () {
                    if (newValue != null) {
                      _fruit = newValue;
                    } else {
                      print("values es null");
                    }
                  },
                );
              },
              value: _fruit,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_username.isEmpty || _fruit.isEmpty) {
                    return;
                  } else {
                    buildMessage(_username, _fruit);
                  }
                },
                child: const Text("saludar!")),
            Text(_message)
          ],
        ),
      ),
    );
  }

  void buildMessage(String nombre, String fruta) {
    var message = "Hola $nombre, fruta ravorita $fruta";
    setState(() {
      _message = message;
    });
  }
}
