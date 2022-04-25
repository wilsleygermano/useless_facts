import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

Future<GetUselessFacts> getUselessFact() async {
  final dio = Dio();
  const uselessURL = "https://uselessfacts.jsph.pl/random.json?language=en";
  final response = await dio.get(uselessURL);
  final json = jsonDecode(response.data.toString());
  final uselessfacts = GetUselessFacts.fromJson(json as Map<String, dynamic>);
  return uselessfacts;
}

class GetUselessFacts {
  String? text;
  String? source;
  String? sourceUrl;
  String? language;

  GetUselessFacts({
    this.language,
    this.source,
    this.sourceUrl,
    this.text,
  });

    GetUselessFacts.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    source = json['source'];
    sourceUrl = json['source_url'];
    language = json['language'];
  }

   Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['source'] = this.source;
    data['source_url'] = this.sourceUrl;
    data['language'] = this.language;
    return data;
  }

}
