import 'package:cronometro/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: const Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late TextEditingController textShort;
  late TextEditingController textLong;
  late TextEditingController textWork;

  static const String WORKTIME = "worktime";
  static const String SHROTBREAK = "shortbreak";
  static const String LONGBREAK = "longbreak";

  late int workTime;
  late int shortBreak;
  late int longBreak;

  late SharedPreferences prefs;

  @override
  void initState() {
    textWork = TextEditingController();
    textShort = TextEditingController();
    textLong = TextEditingController();

    readSettings();
    super.initState();
  }

  TextStyle textStyle = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        crossAxisCount: 3, //Numero de columnas
        childAspectRatio: 3, //Ancho 3 veces mas que la altura
        crossAxisSpacing: 10, //espaciado entre columnas
        mainAxisSpacing: 10, //espaciado entre filas
        children: [
          Text(
            "Work",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          const SettingsButton(null, Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: textWork,
          ),
          const SettingsButton(null, Color(0xff009688), "+", 1),
          Text(
            "Short",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          const SettingsButton(null, Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: textShort,
          ),
          const SettingsButton(null, Color(0xff009688), "+", 1),
          Text(
            "Long",
            style: textStyle,
          ),
          Text(""),
          Text(""),
          const SettingsButton(null, Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: textLong,
          ),
          const SettingsButton(null, Color(0xff009688), "+", 1),
        ],
        padding: const EdgeInsets.all(20),
      ),
    );
  }

  readSettings() async {
    prefs = await SharedPreferences.getInstance();
    int? workTime = prefs.getInt(WORKTIME);
    int? shortBreak = prefs.getInt(SHROTBREAK);
    int? longBreak = prefs.getInt(LONGBREAK);

    setState(() {
      if (workTime != null) {
        textWork.text = workTime.toString();
      }
      if (shortBreak != null) {
        textShort.text = shortBreak.toString();
      }
      if (longBreak != null) {
        textLong.text = longBreak.toString();
      }
    });
  }

  void updateSettings(String key, int value) {
    switch (key) {
      case WORKTIME:
        int? workTime = prefs.getInt(WORKTIME);
        if (workTime != null) {
          workTime += value;

          if (workTime >= 1 && workTime <= 180) {
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              textWork.text = workTime.toString();
            });
          }
        }
        break;

      case SHROTBREAK:
        int? shortTime = prefs.getInt(SHROTBREAK);
        if (shortTime != null) {
          shortTime += value;

          if (shortTime >= 1 && shortTime <= 180) {
            prefs.setInt(SHROTBREAK, shortTime);
            setState(() {
              textShort.text = shortTime.toString();
            });
          }
        }
        break;

      case LONGBREAK:
        int? longTime = prefs.getInt(LONGBREAK);
        if (longTime != null) {
          longTime += value;

          if (longTime >= 1 && longTime <= 180) {
            prefs.setInt(LONGBREAK, longTime);
            setState(() {
              textLong.text = longTime.toString();
            });
          }
        }
        break;
    }
  }
}
