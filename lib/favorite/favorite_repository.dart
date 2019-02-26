import 'dart:async';
import 'package:rxdart/subjects.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';

abstract class FavoriteRepository {
  Stream<Iterable<Favorite>> get favorites;
  addFavorite(Favorite favorite);
  removeFavorite(Favorite favorite);
}

class InMemoryFavoriteRepository extends FavoriteRepository {
  //ignore: close_sinks
  BehaviorSubject<BuiltSet<Favorite>> _subject = BehaviorSubject();

  InMemoryFavoriteRepository() {
    _subject.add(BuiltSet());
  }

  @override
  Stream<Iterable<Favorite>> get favorites => _subject.stream;

  @override
  addFavorite(Favorite favorite) =>
      _subject.add(_subject.value.rebuild((items) => items.add(favorite)));

  @override
  removeFavorite(Favorite favorite) => _subject.add(_subject.value
      .rebuild((items) => items.removeWhere((item) => item.id == favorite.id)));
}

@immutable
class Favorite {
  final String id;

  Favorite({this.id});
}