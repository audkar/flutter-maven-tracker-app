import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('artifacts list empty state', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('visible', () async {
      SerializableFinder noItemsText = find.text('No items');
      await driver.waitFor(noItemsText);
      await screenshot(driver, "home");
    });
  });
}

Future screenshot(var driver, String name) async {
  final stagingDir = 'build/screenshots';
  await driver.waitUntilNoTransientCallbacks();
  final List<int> pixels = await driver.screenshot();
  final File file =
      await File(stagingDir + '/' + name + '.png').create(recursive: true);
  await file.writeAsBytes(pixels);
  print('Screenshot created');
}
