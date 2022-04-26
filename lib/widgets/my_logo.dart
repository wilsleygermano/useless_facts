import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/Useless.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
