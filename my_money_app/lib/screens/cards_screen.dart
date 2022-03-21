import 'package:flutter/material.dart';
import 'package:my_money_app/screens/newCard_screen.dart';
import 'package:my_money_app/screens/transaction_screen.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({Key? key}) : super(key: key);

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Accounts"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => NewCardScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
