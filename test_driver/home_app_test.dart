import 'dart:async';

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
    });
  });
}
