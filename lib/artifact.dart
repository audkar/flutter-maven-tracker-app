import 'package:meta/meta.dart';

class Artifact {
  final String id;
  final String group;
  final String artifactName;
  final String latestVersion;
  final DateTime timestamp;

  Artifact({
    @required this.id,
    @required this.group,
    @required this.artifactName,
    @required this.latestVersion,
    @required this.timestamp,
  });

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      id: json['id'],
      group: json['g'],
      artifactName: json['a'],
      latestVersion: json['latestVersion'],
      timestamp: DateTime.fromMillisecondsSinceEpoch(json['timestamp']),
    );
  }
}

class ArtifactResponse {
  final int numFound;
  final int start;
  final List<Artifact> artifacts;

  ArtifactResponse({this.numFound, this.start, this.artifacts});

  factory ArtifactResponse.fromJson(Map<String, dynamic> json) {
    return ArtifactResponse(
      numFound: json['numFound'],
      start: json['start'],
      artifacts:
          (json['docs'] as List).map((i) => Artifact.fromJson(i)).toList(),
    );
  }
}
