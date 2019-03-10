library artifact;

import 'dart:convert';
import 'package:MavenArtifactsTracker/utils/serialization/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'artifact.g.dart';

abstract class Artifact implements Built<Artifact, ArtifactBuilder> {
  Artifact._();

  factory Artifact([updates(ArtifactBuilder b)]) = _$Artifact;

  @BuiltValueField(wireName: 'id')
  String get id;
  @BuiltValueField(wireName: 'g')
  String get group;
  @BuiltValueField(wireName: 'a')
  String get artifactName;
  @BuiltValueField(wireName: 'latestVersion')
  String get latestVersion;
  @BuiltValueField(wireName: 'timestamp')
  DateTime get timestamp;
  @BuiltValueField(wireName: 'id')
  String toJson() {
    return json.encode(serializers.serializeWith(Artifact.serializer, this));
  }

  static Artifact fromJson(String jsonString) {
    return serializers.deserializeWith(
        Artifact.serializer, json.decode(jsonString));
  }

  static Serializer<Artifact> get serializer => _$artifactSerializer;
}
