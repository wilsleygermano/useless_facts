import 'package:flutter/material.dart';

class MyButtons extends StatefulWidget {
  const MyButtons({Key? key}) : super(key: key);

  @override
  State<MyButtons> createState() => _MyButtonsState();
}

class _MyButtonsState extends State<MyButtons> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.clear,
            color: Colors.red,
            size: 48,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 8,
            shape: CircleBorder(),
            minimumSize: Size.square(80)
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.star,
            color: Colors.blue,
            size: 48,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 8,
            shape: CircleBorder(),
            minimumSize: Size.square(80)
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Icon(
            Icons.favorite,
            color: Colors.green,
            size: 48,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            elevation: 8,
            shape: CircleBorder(),
            minimumSize: Size.square(80)
          ),
        )
      ],
    );
  }
}
