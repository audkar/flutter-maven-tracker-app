import 'package:MavenArtifactsTracker/api/maven_api.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:MavenArtifactsTracker/global_dependencies_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:MavenArtifactsTracker/search/search_artifacts_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  SearchArtifactsPage page;
  GlobalDependenciesModel dependenciesModel;

  setUp(() async {
    page = SearchArtifactsPage();
    dependenciesModel = GlobalDependenciesModel(mavenApi: MockMavenApi());
  });

  group('Initial widget open', () {
    testWidgets('No items text is shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        dependenciesModel,
        page,
      ));

      expect(find.text('No items'), findsOneWidget);
    });
    testWidgets('Item count is zero', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        dependenciesModel,
        page,
      ));

      expect(find.text('Items: 0'), findsOneWidget);
    });
  });

  group('Press search with empty query', () {
    testWidgets('No items text is shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        dependenciesModel,
        page,
      ));

      await tester.enterText(
          find.widgetWithText(TextField, 'Artifact name'), '');
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pump();

      expect(find.text('No items'), findsOneWidget);
    });
  });

  group('Press search with valid query', () {
    testWidgets('Loaded items are shown', (WidgetTester tester) async {
      await tester.pumpWidget(createTestApp(
        dependenciesModel,
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
        dependenciesModel,
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
      await tester.pumpWidget(createTestApp(dependenciesModel, page));
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

ScopedModel<GlobalDependenciesModel> createTestApp(
  GlobalDependenciesModel dependenciesModel,
  SearchArtifactsPage page,
) {
  return ScopedModel(
    model: dependenciesModel,
    child: MaterialApp(home: page),
  );
}

class MockMavenApi extends MavenApi {
  @override
  Future<ArtifactResponse> fetchArtifacts(
    String query,
    int start,
    int rows,
  ) {
    return Future.value(ArtifactResponse(
      numFound: 2,
      artifacts: [
        Artifact(
          artifactName: 'artifactname0',
          id: 'artifactgroup0.artifactname0',
          group: 'artifactgroup0',
          latestVersion: '1.0',
          timestamp: DateTime.fromMillisecondsSinceEpoch(100),
        ),
        Artifact(
          artifactName: 'artifactname1',
          id: 'artifactgroup1.artifactname1',
          group: 'artifactgroup1',
          latestVersion: '1.1',
          timestamp: DateTime.fromMillisecondsSinceEpoch(100),
        ),
      ],
      start: 0,
    ));
  }
}
