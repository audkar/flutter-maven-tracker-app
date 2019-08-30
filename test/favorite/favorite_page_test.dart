import 'package:MavenArtifactsTracker/artifact/favorite/bloc/bloc.dart';
import 'package:MavenArtifactsTracker/artifact/favorite/favorite_list_page.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import '../utils/mocks.dart';

main() {
  Widget page;

  setUp(() async {
    page = BlocProvider(
      builder: (BuildContext context) => FavoriteListBloc(
          SearchArtifactRepository(MockMavenApi()),
          InMemoryFavoriteRepository(
              favoritesPersistor: MockFavoritesPersistor())),
      child: FavoriteListPage(),
    );
  });

  group('Initial page open without items', () {
    testWidgets('empty state shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(page));
      await tester.pumpAndSettle();

      expect(find.text('No items'), findsOneWidget);
    });
  });

  group('Initial page open with items', () {
    testWidgets('items shown', (tester) async {
      await tester.pumpWidget(createTestApp(page));
    });
  });
}
