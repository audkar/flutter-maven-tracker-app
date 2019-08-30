import 'dart:async';
import 'package:MavenArtifactsTracker/artifact/artifact_model.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:MavenArtifactsTracker/utils/intl_formats.dart';
import 'package:MavenArtifactsTracker/utils/pagination/page.dart';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import './bloc.dart';

class SearchArtifactsBloc
    extends Bloc<SearchArtifactsEvent, SearchArtifactsState> {
  final SearchArtifactRepository _searchRepository;
  final FavoriteRepository _favoriteRepository;
  StreamSubscription _favoritesSubscription;

  SearchArtifactsBloc(
    this._searchRepository,
    this._favoriteRepository,
  ) {
    _favoritesSubscription = _favoriteRepository.favorites.listen((it) {
      dispatch(UpdateFavorites(it.toList()));
    });
  }

  @override
  SearchArtifactsState get initialState => Initial();

  @override
  Stream<SearchArtifactsState> mapEventToState(
    SearchArtifactsEvent event,
  ) async* {
    if (event is ExecuteQuery) {
      if (event.searchQuery.isEmpty) {
        return;
      }
      yield Loading((b) => b..favorites.replace(currentState.favorites));
      final searchQuery = event.searchQuery;
      yield* _loadPage(searchQuery: searchQuery);
    } else if (event is ExecuteQueryNextPage) {
      final stateCopy = currentState as ArtifactResults;
      yield stateCopy.rebuild((b) => b
        ..isLoadingInProgress = true
        ..canLoadMore = false);
      final currentPage = stateCopy.artifactsPage;
      final searchQuery = stateCopy.searchQuery;
      final artifacts = stateCopy.artifacts;
      yield* _loadPage(
        searchQuery: searchQuery,
        currentPage: currentPage,
        artifacts: artifacts,
      );
    } else if (event is UpdateFavorites) {
      final stateCopy = currentState;
      final favorites = event.favorites;
      if (stateCopy is ArtifactResults) {
        final artifacts = stateCopy.artifacts
            .map((it) =>
                it.updateFavorite(favorites.any((fav) => fav.id == it.id)))
            .toList();
        yield stateCopy.rebuild((b) =>
            b..favorites.replace(favorites)..artifacts.replace(artifacts));
      } else {
        yield stateCopy.rebuild((b) => b..favorites.replace(favorites));
      }
    } else if (event is ToggleFavorite) {
      final artifact = event.artifact;
      final favorite = Favorite((b) {
        return b..id = artifact.id;
      });
      if (artifact.isFavorite) {
        _favoriteRepository.removeFavorite(favorite);
      } else {
        _favoriteRepository.addFavorite(favorite);
      }
    } else {
      throw StateError("Don't known how to handle event type: $event");
    }
  }

  Stream<SearchArtifactsState> _loadPage({
    @required String searchQuery,
    Page currentPage,
    BuiltList<ArtifactModel> artifacts,
  }) async* {
    artifacts = artifacts ?? BuiltList();
    final results = await _searchRepository.fetchArtifactsPaged(
      query: searchQuery,
      previousPage: currentPage,
      itemsPerPage: _ROWS_PER_PAGE,
    ); //TODO: handle network errors
    final page = results.item1;
    final favorites = currentState.favorites;
    final newArtifacts = results.item2.map((it) => ArtifactModel.from(
          it,
          dateFormat,
          favorites.any((favorite) => it.id == favorite.id),
        ));
    yield ArtifactResults((b) => b
      ..searchQuery = searchQuery
      ..artifactsPage = page
      ..artifacts.replace(artifacts.followedBy(newArtifacts))
      ..favorites.replace(favorites)
      ..isLoadingInProgress = false
      ..canLoadMore = page.hasMoreItems);
  }

  @override
  void dispose() {
    super.dispose();
    _favoritesSubscription?.cancel();
  }
}

const int _ROWS_PER_PAGE = 20;
