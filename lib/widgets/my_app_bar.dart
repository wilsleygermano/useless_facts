import 'package:flutter/material.dart';
import 'package:useless_app/design/my_colors.dart';
import 'package:useless_app/design/my_fonts.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Useless (but true) Facts",
        style: TextStyle(fontFamily: MyFonts.titleFont, fontWeight: FontWeight.bold),
      ),
      backgroundColor: MyColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
