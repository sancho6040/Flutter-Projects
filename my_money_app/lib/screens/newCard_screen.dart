import 'package:flutter/material.dart';

class NewCardScreen extends StatefulWidget {
  NewCardScreen({Key? key}) : super(key: key);

  @override
  State<NewCardScreen> createState() => _NewCardScreenState();
}

class _NewCardScreenState extends State<NewCardScreen> {
  late String id;
  late String _name;
  late double _value;
  late bool _isCredit;

  final TextEditingController txtName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Card")),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              nameInput(),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: TextFormField(
        controller: txtName,
        decoration: const InputDecoration(
          hintText: "Name",
        ),
        validator: (text) => text!.isEmpty ? "The name is required " : "",
      ),
    );
  }
}
