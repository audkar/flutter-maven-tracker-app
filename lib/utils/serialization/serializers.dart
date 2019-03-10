library serializers;

import 'package:MavenArtifactsTracker/api/artifact_response.dart';
import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'datetime_serializer.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  Artifact,
  ArtifactResponse,
  ResponseHeader,
  Response,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(MillisecondsDateTimeSerializer()))
    .build();
