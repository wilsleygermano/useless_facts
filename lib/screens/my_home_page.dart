import 'package:flutter/material.dart';
import 'package:useless_app/data/get_useless_fact.dart';
import 'package:useless_app/design/my_colors.dart';
import 'package:useless_app/design/my_fonts.dart';
import 'package:useless_app/widgets/fact_card.dart';
import 'package:useless_app/widgets/my_buttons.dart';
import 'package:useless_app/widgets/my_logo.dart';

class MyHomePage extends StatefulWidget {
  

  MyHomePage({
    Key? key,

  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  return Column(
                    children: [
                      const MyLogo(),
                      const SizedBox(height: 16,),
                      Expanded(
                        child: FactCard(
                          factText: snapshot.data!.text,
                          factSource: snapshot.data!.source,
                        ),
                      ),
                      const SizedBox(height: 16,),
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
