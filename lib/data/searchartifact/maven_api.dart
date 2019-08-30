import 'package:http/http.dart' as http;

import 'artifact_response.dart';

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
