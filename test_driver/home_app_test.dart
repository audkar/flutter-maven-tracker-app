import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('home page', () {
    test('visible', () async {
      SerializableFinder searchButton = find.text('Search');
      await driver.waitFor(searchButton);
      await screenshot(driver, "home");
    });
  });

  group('search artifacts page', () {
    setUp(() async {
      await driver.tap(find.text('Search'));
    });

    tearDown(() async {
      await driver.tap(find.pageBack());
    });

    test('visible', () async {
      SerializableFinder searchArtifactsTitle = find.text('Search artifacts');
      await driver.waitFor(searchArtifactsTitle);
      SerializableFinder enterQueryText = find.text('Enter new query');
      await driver.waitFor(enterQueryText);
      await screenshot(driver, "search");
    });
  });

  group('favorites page', () {
    setUp(() async {
      await driver.tap(find.text('Favorite list'));
    });

    tearDown(() async {
      await driver.tap(find.pageBack());
    });

    test('visible', () async {
      SerializableFinder favoritesTitle = find.text('Favorites');
      await driver.waitFor(favoritesTitle);
      SerializableFinder noItemsText = find.text('No items');
      await driver.waitFor(noItemsText);
      await screenshot(driver, "favorites");
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
