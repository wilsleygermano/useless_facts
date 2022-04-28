import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:useless_app/controller/fact_source_controller.dart';
import '../design/my_colors.dart';
import '../design/my_fonts.dart';

class FactCard extends StatefulWidget {
  final String imageUrl;
  final String factText;
  final String factSource;
  final String sourceUrl;

  const FactCard({
    Key? key,
    required this.factText,
    required this.factSource,
    required this.imageUrl,
    required this.sourceUrl,
  }) : super(key: key);

  @override
  State<FactCard> createState() => _FactCardState();
}

class _FactCardState extends State<FactCard> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () async {
          await urlLauncher(widget.sourceUrl);
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.imageUrl),
              fit: BoxFit.cover,
            ),
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
                        child: BorderedText(
                          strokeWidth: 5.0,
                          strokeColor: Colors.black,
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
      ),
    );
  }
}
