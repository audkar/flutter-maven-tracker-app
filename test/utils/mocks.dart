import 'package:MavenArtifactsTracker/data/favorite/favorite_persistor.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/artifact_response.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/maven_api.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:built_collection/src/set.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<RepositoryProvider<dynamic>> createTestRepositoryProviders() => [
      RepositoryProvider<FavoriteRepository>(
        builder: (BuildContext context) => InMemoryFavoriteRepository(
            favoritesPersistor: MockFavoritesPersistor()),
      ),
      RepositoryProvider<SearchArtifactRepository>(
          builder: (BuildContext context) =>
              SearchArtifactRepository(MockMavenApi())),
    ];

Widget createTestApp(
  Widget widget,
) {
  return MaterialApp(home: widget);
}

class MockMavenApi extends MavenApi {
  @override
  Future<ArtifactResponse> fetchArtifacts(
    String query,
    int start,
    int rows,
  ) {
    return Future.value(ArtifactResponse((b) => b
      ..responseHeader.status = 0
      ..response.start = 0
      ..response.numFound = 2
      ..response.artifacts.addAll([
        Artifact((b) => b
          ..artifactName = 'artifactname0'
          ..id = 'artifactgroup0.artifactname0'
          ..group = 'artifactgroup0'
          ..latestVersion = '1.0'
          ..timestamp = DateTime.fromMillisecondsSinceEpoch(100)),
        Artifact((b) => b
          ..artifactName = 'artifactname1'
          ..id = 'artifactgroup1.artifactname1'
          ..group = 'artifactgroup1'
          ..latestVersion = '1.1'
          ..timestamp = DateTime.fromMillisecondsSinceEpoch(100)),
      ])));
  }
}

class MockFavoritesPersistor implements FavoritesPersistor {
  BuiltSet<Favorite> favorites = BuiltSet.of([]);
  Stream<BuiltSet<Favorite>> persistedItems;

  @override
  void persist(Stream<BuiltSet<Favorite>> items) {
    persistedItems = items;
  }

  @override
  Future<BuiltSet<Favorite>> retrieve() {
    return Future.value(favorites);
  }
}
