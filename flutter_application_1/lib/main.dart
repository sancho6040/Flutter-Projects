import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //MaterialAoo es un widget
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Hola mundo, desde flutter"),
            backgroundColor: Colors.deepPurple,
          ),
          body: const MyHomePage(title: "Hola mundo, desde flutter"),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40), //padding a todos los lados
              child: Column(
                children: [
                  Text(
                    "mi primer Widget",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  const Text(
                    "mi segundo widget",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.deepPurpleAccent,
                    ),
                  )
                ],
              ),
            ),
            Image.network(
                "https://images.unsplash.com/photo-1586227740560-8cf2732c1531?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=961&q=80"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20)),
              onPressed: () {
                contactUs(context);
              },
              child: const Text("Aceptar"),
            )
          ],
        ),
      ),
    );
  }

  void contactUs(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("contactanos..."),
            content: const Text("envia un correo a email@tzuzulcode.com"),
            actions: [
              TextButton(
                  onPressed: () =>
                      Navigator.of(context).pop(), //Navega hacia atras
                  child: const Text("Cerrar"))
            ],
          );
        });
  }
}



/*class HomePage extends StatefulWidget {
  HomePage({Key key, required this.title}) : super(key: key);

  final String title;

  //State Companion Object
  @override
  _HomePageState createState() {
    return _HomePageState();
  }

  //_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    }); //setState()
  } //_increment

  @override
  Widget build(BuildContext context) {

  }
}//class _HomePage state
*/