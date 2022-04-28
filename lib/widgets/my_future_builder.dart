import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:useless_app/classes/my_spinkit.dart';
import '../controller/share_fact_controller.dart';
import '../data/get_useless_fact.dart';
import 'fact_card.dart';
import '../classes/my_buttons.dart';
import '../classes/my_logo.dart';

// ignore: must_be_immutable
class MyFutureBuilder extends StatefulWidget {
  String? text;
  String? source;
  int counter;
  String? sourceUrl;

  MyFutureBuilder({
    Key? key,
    this.source,
    this.text,
    this.counter = 1,
    this.sourceUrl,
  }) : super(key: key);

  @override
  State<MyFutureBuilder> createState() => _MyFutureBuilderState();
}

class _MyFutureBuilderState extends State<MyFutureBuilder> {
  ScreenshotController screenshotController = ScreenshotController();
  ShareFactController shareFactController = ShareFactController();

  late Future<Album> futureFactAlbum;

  @override
  void initState() {
    super.initState();
    futureFactAlbum = getUselessFact();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Album>(
      future: futureFactAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          widget.source = snapshot.data!.source;
          widget.text = snapshot.data!.text;
          widget.sourceUrl = snapshot.data!.sourceUrl;
          return Column(
            children: [
              const MyLogo(),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                child: Screenshot(
                  controller: screenshotController,
                  child: FactCard(
                    sourceUrl: widget.sourceUrl!,
                    factText: widget.text!,
                    factSource: widget.source!,
                    imageUrl:
                        'https://picsum.photos/600?random=${widget.counter}',
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              MyButtons(
                onShareTap: () async => await captureScreen(),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const MySpinKit();
      },
    );
  }

  Future<void> captureScreen() async {
    await shareFactController.screenCapture(screenshotController);
  }  
}
