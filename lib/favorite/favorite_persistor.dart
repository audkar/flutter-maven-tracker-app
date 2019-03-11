import 'package:MavenArtifactsTracker/favorite/favorite.dart';
import 'package:built_collection/built_collection.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FavoritesPersistor {
  void persist(Stream<BuiltSet<Favorite>> items);
  Future<BuiltSet<Favorite>> retrieve();
}

class SharedPrefFavoritePersistor implements FavoritesPersistor {
  static const String _key = 'favorites';

  @override
  void persist(Stream<BuiltSet<Favorite>> items) {
    items.listen((onData) async {
      print('Persisting favorites');
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList(_key, onData.map((i) => i.id).toList());
    });
  }

  @override
  Future<BuiltSet<Favorite>> retrieve() async {
    print('retrieve persisted favorites');
    final prefs = await SharedPreferences.getInstance();
    return BuiltSet.of(prefs
            .getStringList(_key)
            ?.map((item) => Favorite((b) => b..id = item)) ??
        []);
  }
}
