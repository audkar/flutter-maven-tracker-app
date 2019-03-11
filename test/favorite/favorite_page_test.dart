import 'package:MavenArtifactsTracker/favorite/favorite_list_page.dart';
import 'package:MavenArtifactsTracker/global_dependencies_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../utils/mocks.dart';

main() {
  FavoriteListPage page;
  GlobalDependenciesModel dependenciesModel;

  setUp(() async {
    page = FavoriteListPage();
    dependenciesModel = createTestDependenciesModel();
  });

  group('Initial page open without items', () {
    testWidgets('empty state shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(dependenciesModel, page));

      expect(find.byType(ListView), findsNothing);
    });
  });

  group('Initial page open with items', () {
    testWidgets('items shown', (tester) async {
      await tester.pumpWidget(createTestApp(dependenciesModel, page));
    });
  });
}
