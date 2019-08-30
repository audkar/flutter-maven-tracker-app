library artifact_response;

import 'dart:convert';

import 'package:MavenArtifactsTracker/utils/serialization/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'artifact_response.g.dart';

abstract class ArtifactResponse
    implements Built<ArtifactResponse, ArtifactResponseBuilder> {
  ArtifactResponse._();

  factory ArtifactResponse([updates(ArtifactResponseBuilder b)]) =
      _$ArtifactResponse;

  @BuiltValueField(wireName: 'responseHeader')
  ResponseHeader get responseHeader;
  @BuiltValueField(wireName: 'response')
  Response get response;

  String toJson() =>
      json.encode(serializers.serializeWith(ArtifactResponse.serializer, this));

  static ArtifactResponse fromJson(String jsonString) => serializers
      .deserializeWith(ArtifactResponse.serializer, json.decode(jsonString));

  static Serializer<ArtifactResponse> get serializer =>
      _$artifactResponseSerializer;
}

abstract class ResponseHeader
    implements Built<ResponseHeader, ResponseHeaderBuilder> {
  ResponseHeader._();

  factory ResponseHeader([updates(ResponseHeaderBuilder b)]) = _$ResponseHeader;

  @BuiltValueField(wireName: 'status')
  int get status;

  static Serializer<ResponseHeader> get serializer =>
      _$responseHeaderSerializer;
}

abstract class Response implements Built<Response, ResponseBuilder> {
  Response._();

  factory Response([updates(ResponseBuilder b)]) = _$Response;

  @BuiltValueField(wireName: 'numFound')
  int get numFound;
  @BuiltValueField(wireName: 'start')
  int get start;
  @BuiltValueField(wireName: 'docs')
  BuiltList<Artifact> get artifacts;

  static Serializer<Response> get serializer => _$responseSerializer;
}

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
