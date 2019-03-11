import 'package:MavenArtifactsTracker/api/maven_api.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_persistor.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_repository.dart';
import 'package:scoped_model/scoped_model.dart';

class GlobalDependenciesModel extends Model {
  final MavenApi mavenApi;
  final FavoriteRepository favoriteRepository;

  GlobalDependenciesModel({
    MavenApi mavenApi,
    FavoriteRepository favoriteRepository,
  })  : this.mavenApi = mavenApi ?? MavenApi.central(),
        this.favoriteRepository = favoriteRepository ??
            InMemoryFavoriteRepository(
                favoritesPersistor: SharedPrefFavoritePersistor());
}
