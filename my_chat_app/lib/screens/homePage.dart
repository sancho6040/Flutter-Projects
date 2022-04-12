import 'package:flutter/material.dart';
import 'package:my_chat_app/shared/authentication.dart';
import 'package:my_chat_app/screens/chatPage.dart';
import 'package:my_chat_app/screens/loginScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    Authentication authentication = Authentication();
    authentication.getUser().then((user) {
      MaterialPageRoute route;
      if (user != null) {
        route =
            MaterialPageRoute(builder: (context) => ChatPage(null, user.uid));
      } else {
        route = MaterialPageRoute(builder: (context) => const LoginScreen());
      }

      Navigator.pushReplacement(context, route);
    }).catchError((err) => print(err));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
