import 'package:flutter/material.dart';
import 'package:useless_app/data/get_useless_fact.dart';
import 'package:useless_app/widgets/fact_card.dart';
import 'package:useless_app/widgets/my_buttons.dart';
import 'package:useless_app/widgets/my_logo.dart';

class MyHomePage extends StatefulWidget {
  String? text;
  String? source;
  int counter;

  MyHomePage({
    Key? key,
    this.source,
    this.text,
    this.counter = 1,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  
  bool loading = false;
  late Future<Album> futureFactAlbum;

  @override
  void initState() {
    super.initState();
    futureFactAlbum = getUselessFact();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.shade200, Colors.black],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(16),
            child: FutureBuilder<Album>(
              future: futureFactAlbum,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  widget.source = snapshot.data!.source;
                  widget.text = snapshot.data!.text;
                  return Column(
                    children: [
                      const MyLogo(),
                      const SizedBox(
                        height: 16,
                      ),
                      Expanded(
                        child: FactCard(
                          factText: widget.text!,
                          factSource: widget.source!,
                          imageUrl: 'https://picsum.photos/600?grayscale&random=${widget.counter}',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MyButtons(),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.purple,
                  strokeWidth: 8.0,
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}
