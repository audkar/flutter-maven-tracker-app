import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:test/test.dart';

import '../utils/mocks.dart';

main() {
  group('modify favorites', () {
    FavoriteRepository repository;

    setUp(() {
      repository = InMemoryFavoriteRepository();
    });

    test('subscribers notified', () async {
      final expected = BuiltSet.of([_favorite1]);

      repository.addFavorite(_favorite1);
      final insertedItem = await repository.favorites.first;

      expect(insertedItem, equals(expected));

      repository.removeFavorite(_favorite1);
      final removedItem = await repository.favorites.first;

      expect(removedItem, equals(BuiltSet<Favorite>()));
    });
  });

  group('persister is set', () {
    FavoriteRepository repository;
    MockFavoritesPersistor persistor;

    setUp(() {
      persistor = MockFavoritesPersistor()
        ..favorites = BuiltSet.of([_favorite1]);
      repository = InMemoryFavoriteRepository(favoritesPersistor: persistor);
    });

    test('items retrieved from persistor', () async {
      BuiltSet<Favorite> result = await repository.favorites.first;

      expect(result, equals(BuiltSet.of([_favorite1])));
    });
    test('items is saved to persistor', () async {
      repository.addFavorite(_favorite2);
      BuiltSet<Favorite> result = await repository.favorites.first;

      expect(result, equals(BuiltSet.of([_favorite1, _favorite2])));
    });
  });
}

Favorite _favorite1 = Favorite((b) => b..id = "favId1");
Favorite _favorite2 = Favorite((b) => b..id = "favId2");
