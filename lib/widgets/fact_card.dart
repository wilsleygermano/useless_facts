import 'package:flutter/material.dart';

import '../design/my_colors.dart';
import '../design/my_fonts.dart';

class FactCard extends StatefulWidget {
  const FactCard({
    Key? key,
    required this.factText,
    required this.factSource, required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;
  final String factText;
  final String factSource;

  @override
  State<FactCard> createState() => _FactCardState();
}

class _FactCardState extends State<FactCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.imageUrl), fit: BoxFit.cover),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.5,
                  1,
                ]),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        widget.factText,
                        style: TextStyle(
                          fontFamily: MyFonts.factFont,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: MyColors.whiteColor,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Source: ${widget.factSource}",
                        style: TextStyle(
                            fontFamily: MyFonts.factFont,
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: MyColors.whiteColor,
                            overflow: TextOverflow.fade),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
