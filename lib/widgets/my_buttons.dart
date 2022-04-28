import 'package:flutter/material.dart';
import 'package:useless_app/screens/my_home_page.dart';
import 'dart:math';

class MyButtons extends StatefulWidget {
  const MyButtons({Key? key, required this.onShareTap}) : super(key: key);

  final Function() onShareTap;

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  final int _max = 1000;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: widget.onShareTap,
          child: const Icon(
            Icons.share,
            color: Colors.white,
            size: 48,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              elevation: 8,
              shape: const CircleBorder(),
              minimumSize: const Size.square(60)),
        ),
        ElevatedButton(
          onPressed: () {
            int randomNumber = Random().nextInt(_max) + 1;
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => MyHomePage(
                  counter: randomNumber,
                ),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            );
          },
          child: const Icon(
            Icons.shuffle,
            color: Colors.white,
            size: 48,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              elevation: 8,
              shape: const CircleBorder(),
              minimumSize: const Size.square(60)),
        ),
      ],
    );
  }
}
