import 'package:flutter/material.dart';
import 'package:useless_app/screens/my_home_page.dart';
import 'dart:math';

class MyButtons extends StatefulWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  int max = 1000;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.share,
            color: Colors.blue,
            size: 48,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 8,
              shape: CircleBorder(),
              minimumSize: Size.square(80)),
        ),
        ElevatedButton(
          onPressed: () {
            int randomNumber = Random().nextInt(max) + 1;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        counter: randomNumber,
                      )),
            );
          },
          child: Icon(
            Icons.shuffle,
            color: Colors.green,
            size: 48,
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              elevation: 8,
              shape: CircleBorder(),
              minimumSize: Size.square(80)),
        ),
      ],
    );
  }
}
