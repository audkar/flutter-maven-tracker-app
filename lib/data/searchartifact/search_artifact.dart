import 'package:MavenArtifactsTracker/data/searchartifact/artifact_response.dart';
import 'package:flutter/foundation.dart';

@immutable
class SearchArtifact {
  final String id;
  final String group;
  final String artifactName;
  final String latestVersion;
  final DateTime timestamp;

  SearchArtifact({
    @required this.id,
    @required this.group,
    @required this.artifactName,
    @required this.latestVersion,
    @required this.timestamp,
  });

  factory SearchArtifact.from(Artifact artifact) {
    return SearchArtifact(
      id: artifact.id,
      group: artifact.group,
      artifactName: artifact.artifactName,
      latestVersion: artifact.latestVersion,
      timestamp: artifact.timestamp,
    );
  }
}
