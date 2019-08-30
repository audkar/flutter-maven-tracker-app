import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:built_collection/built_collection.dart';

import 'favorite.dart';
import 'favorite_persistor.dart';

abstract class FavoriteRepository {
  Stream<BuiltSet<Favorite>> get favorites;
  void addFavorite(Favorite favorite);
  void removeFavorite(Favorite favorite);
}

class InMemoryFavoriteRepository extends FavoriteRepository {
  //ignore: close_sinks
  BehaviorSubject<BuiltSet<Favorite>> _subject = BehaviorSubject();
  final FavoritesPersistor favoritesPersistor;

  InMemoryFavoriteRepository({this.favoritesPersistor}) {
    if (favoritesPersistor == null) {
      _subject.add(BuiltSet());
    } else {
      favoritesPersistor
          .retrieve()
          .then((value) => _subject.add(BuiltSet.of(value)))
          .then((onValue) => favoritesPersistor.persist(favorites));
    }
  }

  @override
  Stream<BuiltSet<Favorite>> get favorites => _subject.stream;

  @override
  addFavorite(Favorite favorite) =>
      _subject.add(_subject.value.rebuild((items) => items.add(favorite)));

  @override
  removeFavorite(Favorite favorite) => _subject.add(_subject.value
      .rebuild((items) => items.removeWhere((item) => item.id == favorite.id)));
}
