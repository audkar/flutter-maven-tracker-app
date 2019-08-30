library search_artifacts_state;

import 'package:MavenArtifactsTracker/artifact/artifact_model.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:MavenArtifactsTracker/utils/pagination/page.dart';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'search_artifacts_state.g.dart';

@BuiltValue(instantiable: false)
abstract class SearchArtifactsState {
  BuiltList<Favorite> get favorites;

  SearchArtifactsState rebuild(
      void Function(SearchArtifactsStateBuilder) updates);
}

abstract class Initial
    implements SearchArtifactsState, Built<Initial, InitialBuilder> {
  Initial._();

  factory Initial() => _$Initial();
}

abstract class Loading
    implements SearchArtifactsState, Built<Loading, LoadingBuilder> {
  Loading._();

  factory Loading([void Function(LoadingBuilder) updates]) = _$Loading;
}

abstract class ArtifactResults
    implements
        SearchArtifactsState,
        Built<ArtifactResults, ArtifactResultsBuilder> {
  String get searchQuery;
  Page get artifactsPage;
  BuiltList<ArtifactModel> get artifacts;
  bool get isLoadingInProgress;
  bool get canLoadMore;
  int get itemCount => artifactsPage.totalItemCount;

  ArtifactResults._();

  factory ArtifactResults([void Function(ArtifactResultsBuilder) updates]) =
      _$ArtifactResults;
}
