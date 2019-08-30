import 'package:MavenArtifactsTracker/artifact/artifact_model.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FavoriteListEvent extends Equatable {
  FavoriteListEvent([List props = const <dynamic>[]]) : super(props);
}

@immutable
class LoadArtifacts extends FavoriteListEvent {
  final List<Favorite> favorites;
  LoadArtifacts(this.favorites) : super([favorites]);
}

@immutable
class Refresh extends FavoriteListEvent {}

@immutable
class RemoveFavorite extends FavoriteListEvent {
  final ArtifactModel artifact;

  RemoveFavorite(this.artifact) : super([artifact]);
}
