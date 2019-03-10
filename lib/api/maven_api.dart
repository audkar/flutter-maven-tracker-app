import 'package:MavenArtifactsTracker/api/artifact_response.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

abstract class MavenApi {
  Future<ArtifactResponse> fetchArtifacts(
    String query,
    int start,
    int rows,
  );

  static MavenApi central() {
    return _CentralMavenApi();
  }
}

class _CentralMavenApi implements MavenApi {
  Future<ArtifactResponse> fetchArtifacts(
    String query,
    int start,
    int rows,
  ) async {
    var url =
        "https://search.maven.org/solrsearch/select?q=$query&rows=$rows&start=$start";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ArtifactResponse.fromJson(response.body);
    } else {
      throw Exception('Failed http artifact request: ${response.body}');
    }
  }
}
