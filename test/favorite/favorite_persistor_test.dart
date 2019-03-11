import 'package:MavenArtifactsTracker/favorite/favorite.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_persistor.dart';
import 'package:built_collection/src/set.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test/test.dart';

main() {
  SharedPrefFavoritePersistor persistor;

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, dynamic>{});
    persistor = SharedPrefFavoritePersistor();
  });

  group('on init', () {
    test('empty set returned', () async {
      BuiltSet<Favorite> result = await persistor.retrieve();
      expect(result, equals([]));
    });
  });

  group('add item', () {
    test('added to empty list', () async {
      var items = Stream.fromIterable([_singleItem]).asBroadcastStream();
      persistor.persist(items);

      await items.last;

      BuiltSet<Favorite> result = await persistor.retrieve();
      expect(result, equals(_singleItem));
    });
  });
}

BuiltSet<Favorite> _singleItem = BuiltSet.of([Favorite((b) => b..id = "id")]);
