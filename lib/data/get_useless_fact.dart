import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Album> getUselessFact() async {
  const uselessURL = "https://uselessfacts.jsph.pl/random.json?language=en";
  final response = await http.get(Uri.parse(uselessURL));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load facts');
  }
}

class Album {
  final String text;
  final String source;
  final String sourceUrl;
  final String language;

  const Album({
    required this.language,
    required this.source,
    required this.sourceUrl,
    required this.text,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      language: json['language'],
      source: json['source'],
      sourceUrl: json['source_url'],
      text: json['text'],
    );
  }

}
