import 'dart:async';
import 'dart:collection';

import 'package:MavenArtifactsTracker/api/maven_api.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_repository.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoriteListModel extends Model {
  final MavenApi mavenApi;
  final FavoriteRepository repository;
  Iterable<Artifact> _artifacts = const [];
  Iterable<Favorite> _favorites = const [];
  StreamSubscription<Iterable<Favorite>> _subscription;
  bool isLoading = false;

  FavoriteListModel({
    @required this.mavenApi,
    @required this.repository,
  }) {
    _subscription = repository.favorites.listen((onData) async {
      if (onData.length == 0) {
        _artifacts = [];
        _favorites = [];
      } else {
        isLoading = true;
        notifyListeners();
        final q = onData.map((item) => "id:\"${item.id}\"").join("+OR+");
        final resp = await mavenApi.fetchArtifacts(q, 0, 100);
        print('Favorites fetched new data');
        isLoading = false;
        _artifacts = resp.artifacts;
        _favorites = onData;
      }
      notifyListeners();
    });
  }

  List<Artifact> get artifacts => UnmodifiableListView(_artifacts);
  List<Favorite> get favorites => UnmodifiableListView(_favorites);

  void dispose() {
    _subscription.cancel();
    _subscription = null;
  }
}
