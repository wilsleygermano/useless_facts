import 'package:flutter/material.dart';
import 'package:useless_app/data/get_useless_fact.dart';
import 'package:useless_app/design/my_colors.dart';
import 'package:useless_app/widgets/my_future_builder.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  int counter;

  MyHomePage({
    Key? key,
    this.counter = 1,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late Future<Album> futureFactAlbum;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [MyColors.shadeGrey, MyColors.blackColor],
        ),
      ),
      child: Scaffold(
        backgroundColor: MyColors.transparent,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: MyFutureBuilder(
              counter: widget.counter,
            ),
          ),
        ),
      ),
    );
  }
}
