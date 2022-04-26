import 'package:flutter/material.dart';
import 'package:useless_app/data/get_useless_fact.dart';
import 'package:useless_app/widgets/my_app_bar.dart';

class MyHomePage extends StatefulWidget {
  final String? text;
  final String? source;
  final String? sourceUrl;
  final String? language;

  MyHomePage({
    Key? key,
    this.text,
    this.source,
    this.sourceUrl,
    this.language,
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
    return Scaffold(
      appBar: MyAppBar(),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureFactAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(snapshot.data!.text),
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
    );
  }
}
