import 'package:MavenArtifactsTracker/artifact/search/bloc/bloc.dart';
import 'package:MavenArtifactsTracker/artifact/search/search_artifacts_page.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'utils/mocks.dart';

void main() {
  Widget page;

  setUp(() async {
    page = BlocProvider(
      builder: (BuildContext context) => SearchArtifactsBloc(
        SearchArtifactRepository(MockMavenApi()),
        InMemoryFavoriteRepository(
            favoritesPersistor: MockFavoritesPersistor()),
      ),
      child: SearchArtifactsPage(),
    );
  });

  group('Initial widget open', () {
    testWidgets('No items text is shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        page,
      ));

      expect(find.text('Enter new query'), findsOneWidget);
    });
  });

  group('Press search with empty query', () {
    testWidgets('No items text is shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        page,
      ));

      await tester.enterText(
          find.widgetWithText(TextField, 'Artifact name'), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text('Enter new query'), findsOneWidget);
    });
  });

  group('Press search with valid query', () {
    testWidgets('Loaded items are shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        page,
      ));

      var widgetWithText = find.widgetWithText(TextField, 'Artifact name');
      await tester.enterText(widgetWithText, 'dagger');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.text('artifactname1'), findsOneWidget);
      expect(find.text('artifactgroup1'), findsOneWidget);
    });

    testWidgets('Item count updated', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        page,
      ));

      await tester.enterText(
          find.widgetWithText(TextField, 'Artifact name'), 'dagger');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.text('Items: 2'), findsOneWidget);
    });

    testWidgets('all items are shown', (WidgetTester tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      await tester.pumpWidget(createTestApp(page));
      await tester.enterText(
          find.widgetWithText(TextField, 'Artifact name'), 'dagger');
      await tester.testTextInput.receiveAction(TextInputAction.search);
      await tester.pump();

      expect(find.byKey(Key('searchItem0')), findsOneWidget);
      expect(find.byKey(Key('searchItem1')), findsOneWidget);

      expect(
          find.descendant(
              of: find.byKey(Key('searchArtifactList')),
              matching: find.byType(ListTile)),
          findsNWidgets(2));
      handle.dispose();
    });
  });
}
