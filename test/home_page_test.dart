import 'package:MavenArtifactsTracker/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Home screen shows search button', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Search'), findsOneWidget);
  });
}
