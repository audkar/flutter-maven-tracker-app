import 'package:MavenArtifactsTracker/artifact/artifact_model.dart';
import 'package:MavenArtifactsTracker/data/favorite/favorite.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class SearchArtifactsEvent extends Equatable {
  SearchArtifactsEvent([List props = const <dynamic>[]]) : super(props);
}

@immutable
class ExecuteQuery extends SearchArtifactsEvent {
  final String searchQuery;

  ExecuteQuery(this.searchQuery) : super([searchQuery]);
}

@immutable
class ExecuteQueryNextPage extends SearchArtifactsEvent {}

@immutable
class ToggleFavorite extends SearchArtifactsEvent {
  final ArtifactModel artifact;

  ToggleFavorite(this.artifact) : super([artifact]);
}

@immutable
class UpdateFavorites extends SearchArtifactsEvent {
  final List<Favorite> favorites;
  UpdateFavorites(this.favorites) : super([favorites]);
}
