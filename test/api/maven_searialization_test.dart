import 'dart:io';
import 'package:MavenArtifactsTracker/api/artifact_response.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:built_value_test/matcher.dart';
import 'package:test/test.dart';

main() {
  test('Response deserialized', () {
    File file = File('test_resources/api/maven_search_artifact.json');
    String input = file.readAsStringSync();
    var expected = ArtifactResponse((b) => b
      ..responseHeader.status = 0
      ..response.numFound = 2
      ..response.start = 0
      ..response.artifacts.addAll([
        Artifact((b) => b
          ..id = "artifact.group:aartifact"
          ..group = "artifact.group"
          ..artifactName = "aartifact"
          ..latestVersion = "1.23"
          ..timestamp = DateTime.fromMillisecondsSinceEpoch(
            1547662493000,
            isUtc: true,
          )),
        Artifact((b) => b
          ..id = "artifact.group:bartifact"
          ..group = "artifact.group"
          ..artifactName = "bartifact"
          ..latestVersion = "2.23"
          ..timestamp = DateTime.fromMillisecondsSinceEpoch(
            1547662493000,
            isUtc: true,
          )),
      ]));

    final result = ArtifactResponse.fromJson(input);

    expect(result, equalsBuilt(expected));
  });
}
