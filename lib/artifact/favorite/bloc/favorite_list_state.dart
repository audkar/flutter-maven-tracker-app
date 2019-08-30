library favorite_list_state;

import 'package:MavenArtifactsTracker/artifact/artifact_model.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'favorite_list_state.g.dart';

@BuiltValue(instantiable: false)
abstract class FavoriteListState {
  BuiltList<Favorite> get favorites;

  FavoriteListState rebuild(void Function(FavoriteListStateBuilder) updates);
}

abstract class Loading
    implements FavoriteListState, Built<Loading, LoadingBuilder> {
  Loading._();

  factory Loading([void Function(LoadingBuilder) updates]) = _$Loading;
}

abstract class ArtifactsLoaded
    implements
        FavoriteListState,
        Built<ArtifactsLoaded, ArtifactsLoadedBuilder> {
  BuiltList<ArtifactModel> get artifacts;

  ArtifactsLoaded._();

  factory ArtifactsLoaded([void Function(ArtifactsLoadedBuilder) updates]) =
      _$ArtifactsLoaded;
}
