import 'package:flutter/material.dart';
import 'dart:math';
import 'ball.dart';
import 'bat.dart';

enum Direction { up, down, left, right }

class Pong extends StatefulWidget {
  const Pong({Key? key}) : super(key: key);

  @override
  State<Pong> createState() => _PongState();
}

class _PongState extends State<Pong> with SingleTickerProviderStateMixin {
  late double width;
  late double height;
  int score = 0;
  double increment = 10;
  double posX = 1;
  double posY = 1;
  double randX = 0;
  double randY = 0;
  double batWidth = 0;
  double batHeight = 0;
  double batPosition = 0;

  late Animation animation;
  late AnimationController controller;

  Direction vDir = Direction.down;
  Direction hDir = Direction.right;

  @override
  void initState() {
    posX = 0;
    posY = 0;
    width = 0;
    height = 0;
    controller =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 0, end: 100).animate(controller);
    animation.addListener(() {
      safeSetState(() {
        vDir == Direction.down
            ? posY += ((increment * randY).round()) //if
            : posY -= ((increment * randY).round()); //else
        hDir == Direction.right
            ? posX += ((increment * randX).round())
            : posX -= ((increment * randX).round());
      });
      checkBorders();
    });
    controller.forward(); //inicia la animacion
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      height = constraints.maxHeight;
      width = constraints.maxWidth;
      batWidth = width / 5;
      batHeight = height / 25;
      return Stack(
        children: [
          Positioned(
            child: Text("Score: " + score.toString()),
            top: 10,
            right: 10,
          ),
          Positioned(
            child: Ball(),
            top: posY,
            left: posX,
          ),
          Positioned(
            child: GestureDetector(
              onHorizontalDragUpdate: (DragUpdateDetails update) =>
                  moveBat(update),
              child: Bat(null, batWidth, batHeight),
            ),
            left: batPosition,
            bottom: 0,
          )
        ],
      );
    });
  }

  void moveBat(DragUpdateDetails update) {
    safeSetState(() {
      batPosition += update.delta.dx;
    });
  }

  void checkBorders() {
    double diameter = 50;
    if (posX <= 0 && hDir == Direction.left) {
      hDir = Direction.right;
      randX = randomNumber();
    }
    if (posX >= width - diameter && hDir == Direction.right) {
      hDir = Direction.left;
      randX = randomNumber();
    }

    if (posY <= 0 && vDir == Direction.up) {
      vDir = Direction.down;
      randY = randomNumber();
    }
    if (posY >= height - diameter - batHeight && vDir == Direction.down) {
      if (posX >= (batPosition - diameter - 25) &&
          posX <= (batPosition + batPosition + diameter + 25)) {
        vDir = Direction.up;
        randX = randomNumber();
        safeSetState(() {
          score++;
        });
      } else {
        controller.stop();
        showMessage(context);
      }
    }
  }

  void showMessage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Game Over"),
            content: const Text("Would you like to play again?"),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      posX = 0;
                      posY = 0;
                      score = 0;
                    });
                    Navigator.of(context).pop();
                    controller.repeat();
                  },
                  child: const Text("Yes")),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    dispose();
                  },
                  child: const Text("No"))
            ],
          );
        });
  }

  double randomNumber() {
    var ran = new Random();
    double myNum = ran.nextDouble();

    return myNum + 0.5;
  }

  void safeSetState(Function function) {
    if (mounted && controller.isAnimating) {
      setState(() {
        function();
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
