import 'package:url_launcher/url_launcher.dart';

urlLauncher(String sourceUrl) async {
  if (!await  launchUrl(Uri.parse(sourceUrl))) {
    throw 'Could not launch $sourceUrl';
  }
}
