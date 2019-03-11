import 'dart:async';

import 'package:MavenArtifactsTracker/api/maven_api.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:MavenArtifactsTracker/favorite/favorite.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoriteListModel extends Model {
  final MavenApi mavenApi;
  final FavoriteRepository repository;
  BuiltList<Artifact> _artifacts = BuiltList();
  BuiltList<Favorite> _favorites = BuiltList();
  StreamSubscription<BuiltSet<Favorite>> _subscription;
  bool isLoading = false;

  FavoriteListModel({
    @required this.mavenApi,
    @required this.repository,
  }) {
    _subscription = repository.favorites.listen((onData) async {
      if (onData.length == 0) {
        _artifacts = BuiltList();
        _favorites = BuiltList();
        notifyListeners();
      } else {
        await _refresh(onData);
      }
    });
  }

  Future<void> refresh() async => _refresh(_favorites.toBuiltSet());

  Future _refresh(BuiltSet<Favorite> onData) async {
    isLoading = true;
    notifyListeners();
    final q = onData.map((item) => "id:\"${item.id}\"").join("+OR+");
    final resp = await mavenApi.fetchArtifacts(q, 0, 100);
    print('Favorites fetched new data');
    isLoading = false;
    _artifacts = resp.response.artifacts;
    _favorites = onData.toBuiltList();
    notifyListeners();
  }

  void removeFavorite(Artifact artifact) {
    repository.removeFavorite(Favorite((b) => b..id = artifact.id));
  }

  BuiltList<Artifact> get artifacts => _artifacts;
  BuiltList<Favorite> get favorites => _favorites;

  void dispose() {
    _subscription.cancel();
    _subscription = null;
  }
}
