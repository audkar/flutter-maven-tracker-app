library favorite;

import 'dart:convert';

import 'package:MavenArtifactsTracker/utils/serialization/serializers.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'favorite.g.dart';

abstract class Favorite implements Built<Favorite, FavoriteBuilder> {
  Favorite._();

  factory Favorite([updates(FavoriteBuilder b)]) = _$Favorite;

  @BuiltValueField(wireName: 'id')
  String get id;

  String toJson() {
    return json.encode(serializers.serializeWith(Favorite.serializer, this));
  }

  static Favorite fromJson(String jsonString) {
    return serializers.deserializeWith(
        Favorite.serializer, json.decode(jsonString));
  }

  static Serializer<Favorite> get serializer => _$favoriteSerializer;
}
