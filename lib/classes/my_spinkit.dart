import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:useless_app/design/my_colors.dart';

class MySpinKit extends StatelessWidget {
  const MySpinKit({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: SpinKitDoubleBounce(
            color: MyColors.blackColor,
            size: 100,
          ),
        );
  }
}