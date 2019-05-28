// GENERATED CODE - DO NOT MODIFY BY HAND

part of artifact;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Artifact> _$artifactSerializer = new _$ArtifactSerializer();

class _$ArtifactSerializer implements StructuredSerializer<Artifact> {
  @override
  final Iterable<Type> types = const [Artifact, _$Artifact];
  @override
  final String wireName = 'Artifact';

  @override
  Iterable serialize(Serializers serializers, Artifact object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'g',
      serializers.serialize(object.group,
          specifiedType: const FullType(String)),
      'a',
      serializers.serialize(object.artifactName,
          specifiedType: const FullType(String)),
      'latestVersion',
      serializers.serialize(object.latestVersion,
          specifiedType: const FullType(String)),
      'timestamp',
      serializers.serialize(object.timestamp,
          specifiedType: const FullType(DateTime)),
    ];

    return result;
  }

  @override
  Artifact deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtifactBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'g':
          result.group = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'a':
          result.artifactName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'latestVersion':
          result.latestVersion = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$Artifact extends Artifact {
  @override
  final String id;
  @override
  final String group;
  @override
  final String artifactName;
  @override
  final String latestVersion;
  @override
  final DateTime timestamp;

  factory _$Artifact([void Function(ArtifactBuilder) updates]) =>
      (new ArtifactBuilder()..update(updates)).build();

  _$Artifact._(
      {this.id,
      this.group,
      this.artifactName,
      this.latestVersion,
      this.timestamp})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Artifact', 'id');
    }
    if (group == null) {
      throw new BuiltValueNullFieldError('Artifact', 'group');
    }
    if (artifactName == null) {
      throw new BuiltValueNullFieldError('Artifact', 'artifactName');
    }
    if (latestVersion == null) {
      throw new BuiltValueNullFieldError('Artifact', 'latestVersion');
    }
    if (timestamp == null) {
      throw new BuiltValueNullFieldError('Artifact', 'timestamp');
    }
  }

  @override
  Artifact rebuild(void Function(ArtifactBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtifactBuilder toBuilder() => new ArtifactBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Artifact &&
        id == other.id &&
        group == other.group &&
        artifactName == other.artifactName &&
        latestVersion == other.latestVersion &&
        timestamp == other.timestamp;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), group.hashCode),
                artifactName.hashCode),
            latestVersion.hashCode),
        timestamp.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Artifact')
          ..add('id', id)
          ..add('group', group)
          ..add('artifactName', artifactName)
          ..add('latestVersion', latestVersion)
          ..add('timestamp', timestamp))
        .toString();
  }
}

class ArtifactBuilder implements Builder<Artifact, ArtifactBuilder> {
  _$Artifact _$v;

  String _id;
  String get id => _$this._id;
  set id(String id) => _$this._id = id;

  String _group;
  String get group => _$this._group;
  set group(String group) => _$this._group = group;

  String _artifactName;
  String get artifactName => _$this._artifactName;
  set artifactName(String artifactName) => _$this._artifactName = artifactName;

  String _latestVersion;
  String get latestVersion => _$this._latestVersion;
  set latestVersion(String latestVersion) =>
      _$this._latestVersion = latestVersion;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  ArtifactBuilder();

  ArtifactBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _group = _$v.group;
      _artifactName = _$v.artifactName;
      _latestVersion = _$v.latestVersion;
      _timestamp = _$v.timestamp;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Artifact other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Artifact;
  }

  @override
  void update(void Function(ArtifactBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Artifact build() {
    final _$result = _$v ??
        new _$Artifact._(
            id: id,
            group: group,
            artifactName: artifactName,
            latestVersion: latestVersion,
            timestamp: timestamp);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
