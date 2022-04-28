import 'package:flutter/material.dart';
import '../screens/my_home_page.dart';

class UselessApp extends StatelessWidget {
  const UselessApp({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}
