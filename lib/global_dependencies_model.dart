import 'package:MavenArtifactsTracker/api/maven_api.dart';
import 'package:scoped_model/scoped_model.dart';

class GlobalDependenciesModel extends Model {
  final MavenApi mavenApi;

  GlobalDependenciesModel({MavenApi mavenApi})
      : this.mavenApi = mavenApi ?? MavenApi.central();
}
