library serializers;

import 'package:MavenArtifactsTracker/data/searchartifact/artifact_response.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'datetime_serializer.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  ArtifactResponse,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(MillisecondsDateTimeSerializer()))
    .build();
