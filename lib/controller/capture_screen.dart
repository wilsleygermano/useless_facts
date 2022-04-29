import 'package:screenshot/screenshot.dart';
import 'package:useless_app/controller/share_fact_controller.dart';

Future<void> captureScreen(ShareFactController shareController,
    ScreenshotController screencontroller) async {
  await shareController.screenCapture(screencontroller);
}
