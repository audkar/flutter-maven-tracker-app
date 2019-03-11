import 'package:MavenArtifactsTracker/api/artifact_response.dart';
import 'package:MavenArtifactsTracker/api/maven_api.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:MavenArtifactsTracker/favorite/favorite.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_repository.dart';
import 'package:built_collection/built_collection.dart';
import 'package:meta/meta.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchArtifactsModel extends Model {
  final MavenApi mavenApi;
  final FavoriteRepository favoriteRepository;
  String _searchQuery = '';
  ArtifactsPage _artifacts = ArtifactsPage();
  bool _inProgress = false;

  BuiltList<Artifact> get artifacts => _artifacts.items;

  int get itemCount => _artifacts.itemCount;

  bool get inProgress => _inProgress;

  bool get hasMoreItems => _artifacts.itemCount > _artifacts.items.length;

  Stream<Iterable<Favorite>> get favorites => favoriteRepository.favorites;

  SearchArtifactsModel({
    @required this.mavenApi,
    @required this.favoriteRepository,
  });

  void changeQuery(String query) {
    _searchQuery = query;
  }

  Future<void> refreshItems() async {
    _artifacts = ArtifactsPage();
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (_searchQuery == null || _searchQuery.isEmpty) {
      print('Search query is empty. Skipping artifacts load');
      return;
    }

    _inProgress = true;
    notifyListeners();

    ArtifactResponse resp = await mavenApi.fetchArtifacts(
      _searchQuery,
      _artifacts.nextPageIndex * _ROWS_PER_PAGE,
      _ROWS_PER_PAGE,
    );
    _artifacts = _artifacts.nextPageFrom(resp);

    _inProgress = false;
    notifyListeners();
  }

  void onFavoriteToggle(Artifact artifact, bool isFavorite) {
    final favorite = Favorite(
      (b) => b..id = artifact.id,
    );
    if (isFavorite) {
      favoriteRepository.removeFavorite(favorite);
    } else {
      favoriteRepository.addFavorite(favorite);
    }
  }
}

const int _ROWS_PER_PAGE = 20;

@immutable
class ArtifactsPage {
  final int itemCount;
  final BuiltList<Artifact> items;
  final int currentPage;

  ArtifactsPage({
    this.itemCount = 0,
    BuiltList<Artifact> items,
    this.currentPage = -1,
  }) : this.items = items ?? BuiltList();

  int get nextPageIndex => currentPage + 1;

  ArtifactsPage nextPageFrom(ArtifactResponse response) {
    return ArtifactsPage(
      itemCount: response.response.numFound,
      items: items + response.response.artifacts,
      currentPage: nextPageIndex,
    );
  }
}
