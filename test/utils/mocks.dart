import 'package:MavenArtifactsTracker/api/maven_api.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:MavenArtifactsTracker/global_dependencies_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

ScopedModel<GlobalDependenciesModel> createTestApp(
  GlobalDependenciesModel dependenciesModel,
  Widget widget,
) {
  return ScopedModel(
    model: dependenciesModel,
    child: MaterialApp(home: widget),
  );
}

class MockMavenApi extends MavenApi {
  @override
  Future<ArtifactResponse> fetchArtifacts(
    String query,
    int start,
    int rows,
  ) {
    return Future.value(ArtifactResponse(
      numFound: 2,
      artifacts: [
        Artifact(
          artifactName: 'artifactname0',
          id: 'artifactgroup0.artifactname0',
          group: 'artifactgroup0',
          latestVersion: '1.0',
          timestamp: DateTime.fromMillisecondsSinceEpoch(100),
        ),
        Artifact(
          artifactName: 'artifactname1',
          id: 'artifactgroup1.artifactname1',
          group: 'artifactgroup1',
          latestVersion: '1.1',
          timestamp: DateTime.fromMillisecondsSinceEpoch(100),
        ),
      ],
      start: 0,
    ));
  }
}
