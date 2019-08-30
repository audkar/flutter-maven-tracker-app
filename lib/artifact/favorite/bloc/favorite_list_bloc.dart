import 'dart:async';
import 'package:MavenArtifactsTracker/artifact/artifact_model.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:MavenArtifactsTracker/utils/intl_formats.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FavoriteListBloc extends Bloc<FavoriteListEvent, FavoriteListState> {
  final SearchArtifactRepository _mavenApi;
  final FavoriteRepository _favoriteRepository;
  StreamSubscription _favoritesSubscription;

  FavoriteListBloc(this._mavenApi, this._favoriteRepository) {
    _favoritesSubscription = _favoriteRepository.favorites.listen((it) {
      dispatch(LoadArtifacts(it.toList()));
    });
  }

  @override
  FavoriteListState get initialState => Loading();

  @override
  Stream<FavoriteListState> mapEventToState(
    FavoriteListEvent event,
  ) async* {
    if (event is LoadArtifacts) {
      final stateCopy = currentState;
      final favorites = event.favorites;
      if (favorites.isEmpty) {
        yield ArtifactsLoaded();
      } else if (stateCopy is ArtifactsLoaded) {
        final artifacts = stateCopy.artifacts;
        final hasAllFavorites = favorites.every((fav) {
          return artifacts.any((it) => fav.id == it.id);
        });
        if (hasAllFavorites) {
          yield stateCopy.rebuild((b) => b
            ..artifacts.replace(artifacts.where(
                (artifact) => favorites.any((it) => artifact.id == it.id))));
        } else {
          yield* _loadArtifacts(favorites);
        }
      } else {
        yield* _loadArtifacts(favorites);
      }
    } else if (event is Refresh) {
      final favorites = currentState.favorites;
      yield* _loadArtifacts(favorites);
    } else if (event is RemoveFavorite) {
      _favoriteRepository
          .removeFavorite(Favorite((b) => b..id = event.artifact.id));
    } else {
      throw ArgumentError('Unknown event: $event');
    }
  }

  Stream<FavoriteListState> _loadArtifacts(
    Iterable<Favorite> favorites,
  ) async* {
    yield Loading();
    final q = favorites.map((item) => "id:\"${item.id}\"").join("+OR+");
    final response = await _mavenApi.fetchArtifactsPaged(
        query: q, itemsPerPage: 100); //TODO: extract & handle network errors
    final artifacts = response.item2
        .map((it) => ArtifactModel.from(
            it, dateFormat, favorites.any((fav) => fav.id == it.id)))
        .toList();
    yield ArtifactsLoaded(
        (b) => b..favorites.replace(favorites)..artifacts.replace(artifacts));
  }

  @override
  void dispose() {
    super.dispose();
    _favoritesSubscription?.cancel();
  }
}
