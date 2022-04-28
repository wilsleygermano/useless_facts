import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MySpinKit extends StatelessWidget {
  const MySpinKit({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
          child: SpinKitDoubleBounce(
            color: Colors.black,
            size: 100,
          ),
        );
  }
}