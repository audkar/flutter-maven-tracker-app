import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

@immutable
class ArtifactModel {
  final String id;
  final String group;
  final String artifactName;
  final String latestVersion;
  final String lastUpdate;
  final bool isFavorite;

  ArtifactModel({
    @required this.id,
    @required this.group,
    @required this.artifactName,
    @required this.latestVersion,
    @required this.lastUpdate,
    @required this.isFavorite,
  });

  factory ArtifactModel.from(
    SearchArtifact artifact,
    DateFormat format,
    bool isFavorite,
  ) =>
      ArtifactModel(
        id: artifact.id,
        group: artifact.group,
        artifactName: artifact.artifactName,
        latestVersion: artifact.latestVersion,
        lastUpdate: format.format(artifact.timestamp),
        isFavorite: isFavorite,
      );

  ArtifactModel updateFavorite(bool isFavorite) {
    if (isFavorite == this.isFavorite) {
      return this;
    } else {
      return ArtifactModel(
        id: this.id,
        group: this.group,
        artifactName: this.artifactName,
        latestVersion: this.latestVersion,
        lastUpdate: this.lastUpdate,
        isFavorite: isFavorite,
      );
    }
  }
}
