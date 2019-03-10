// GENERATED CODE - DO NOT MODIFY BY HAND

part of artifact_response;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ArtifactResponse> _$artifactResponseSerializer =
    new _$ArtifactResponseSerializer();
Serializer<ResponseHeader> _$responseHeaderSerializer =
    new _$ResponseHeaderSerializer();
Serializer<Response> _$responseSerializer = new _$ResponseSerializer();

class _$ArtifactResponseSerializer
    implements StructuredSerializer<ArtifactResponse> {
  @override
  final Iterable<Type> types = const [ArtifactResponse, _$ArtifactResponse];
  @override
  final String wireName = 'ArtifactResponse';

  @override
  Iterable serialize(Serializers serializers, ArtifactResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'responseHeader',
      serializers.serialize(object.responseHeader,
          specifiedType: const FullType(ResponseHeader)),
      'response',
      serializers.serialize(object.response,
          specifiedType: const FullType(Response)),
    ];

    return result;
  }

  @override
  ArtifactResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ArtifactResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'responseHeader':
          result.responseHeader.replace(serializers.deserialize(value,
              specifiedType: const FullType(ResponseHeader)) as ResponseHeader);
          break;
        case 'response':
          result.response.replace(serializers.deserialize(value,
              specifiedType: const FullType(Response)) as Response);
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseHeaderSerializer
    implements StructuredSerializer<ResponseHeader> {
  @override
  final Iterable<Type> types = const [ResponseHeader, _$ResponseHeader];
  @override
  final String wireName = 'ResponseHeader';

  @override
  Iterable serialize(Serializers serializers, ResponseHeader object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'status',
      serializers.serialize(object.status, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  ResponseHeader deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseHeaderBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ResponseSerializer implements StructuredSerializer<Response> {
  @override
  final Iterable<Type> types = const [Response, _$Response];
  @override
  final String wireName = 'Response';

  @override
  Iterable serialize(Serializers serializers, Response object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'numFound',
      serializers.serialize(object.numFound,
          specifiedType: const FullType(int)),
      'start',
      serializers.serialize(object.start, specifiedType: const FullType(int)),
      'docs',
      serializers.serialize(object.artifacts,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Artifact)])),
    ];

    return result;
  }

  @override
  Response deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'numFound':
          result.numFound = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'start':
          result.start = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'docs':
          result.artifacts.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(Artifact)])) as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$ArtifactResponse extends ArtifactResponse {
  @override
  final ResponseHeader responseHeader;
  @override
  final Response response;

  factory _$ArtifactResponse([void updates(ArtifactResponseBuilder b)]) =>
      (new ArtifactResponseBuilder()..update(updates)).build();

  _$ArtifactResponse._({this.responseHeader, this.response}) : super._() {
    if (responseHeader == null) {
      throw new BuiltValueNullFieldError('ArtifactResponse', 'responseHeader');
    }
    if (response == null) {
      throw new BuiltValueNullFieldError('ArtifactResponse', 'response');
    }
  }

  @override
  ArtifactResponse rebuild(void updates(ArtifactResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtifactResponseBuilder toBuilder() =>
      new ArtifactResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtifactResponse &&
        responseHeader == other.responseHeader &&
        response == other.response;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, responseHeader.hashCode), response.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArtifactResponse')
          ..add('responseHeader', responseHeader)
          ..add('response', response))
        .toString();
  }
}

class ArtifactResponseBuilder
    implements Builder<ArtifactResponse, ArtifactResponseBuilder> {
  _$ArtifactResponse _$v;

  ResponseHeaderBuilder _responseHeader;
  ResponseHeaderBuilder get responseHeader =>
      _$this._responseHeader ??= new ResponseHeaderBuilder();
  set responseHeader(ResponseHeaderBuilder responseHeader) =>
      _$this._responseHeader = responseHeader;

  ResponseBuilder _response;
  ResponseBuilder get response => _$this._response ??= new ResponseBuilder();
  set response(ResponseBuilder response) => _$this._response = response;

  ArtifactResponseBuilder();

  ArtifactResponseBuilder get _$this {
    if (_$v != null) {
      _responseHeader = _$v.responseHeader?.toBuilder();
      _response = _$v.response?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ArtifactResponse other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArtifactResponse;
  }

  @override
  void update(void updates(ArtifactResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ArtifactResponse build() {
    _$ArtifactResponse _$result;
    try {
      _$result = _$v ??
          new _$ArtifactResponse._(
              responseHeader: responseHeader.build(),
              response: response.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'responseHeader';
        responseHeader.build();
        _$failedField = 'response';
        response.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArtifactResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ResponseHeader extends ResponseHeader {
  @override
  final int status;

  factory _$ResponseHeader([void updates(ResponseHeaderBuilder b)]) =>
      (new ResponseHeaderBuilder()..update(updates)).build();

  _$ResponseHeader._({this.status}) : super._() {
    if (status == null) {
      throw new BuiltValueNullFieldError('ResponseHeader', 'status');
    }
  }

  @override
  ResponseHeader rebuild(void updates(ResponseHeaderBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseHeaderBuilder toBuilder() =>
      new ResponseHeaderBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResponseHeader && status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(0, status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResponseHeader')
          ..add('status', status))
        .toString();
  }
}

class ResponseHeaderBuilder
    implements Builder<ResponseHeader, ResponseHeaderBuilder> {
  _$ResponseHeader _$v;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  ResponseHeaderBuilder();

  ResponseHeaderBuilder get _$this {
    if (_$v != null) {
      _status = _$v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResponseHeader other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResponseHeader;
  }

  @override
  void update(void updates(ResponseHeaderBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$ResponseHeader build() {
    final _$result = _$v ?? new _$ResponseHeader._(status: status);
    replace(_$result);
    return _$result;
  }
}

class _$Response extends Response {
  @override
  final int numFound;
  @override
  final int start;
  @override
  final BuiltList<Artifact> artifacts;

  factory _$Response([void updates(ResponseBuilder b)]) =>
      (new ResponseBuilder()..update(updates)).build();

  _$Response._({this.numFound, this.start, this.artifacts}) : super._() {
    if (numFound == null) {
      throw new BuiltValueNullFieldError('Response', 'numFound');
    }
    if (start == null) {
      throw new BuiltValueNullFieldError('Response', 'start');
    }
    if (artifacts == null) {
      throw new BuiltValueNullFieldError('Response', 'artifacts');
    }
  }

  @override
  Response rebuild(void updates(ResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBuilder toBuilder() => new ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Response &&
        numFound == other.numFound &&
        start == other.start &&
        artifacts == other.artifacts;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, numFound.hashCode), start.hashCode), artifacts.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Response')
          ..add('numFound', numFound)
          ..add('start', start)
          ..add('artifacts', artifacts))
        .toString();
  }
}

class ResponseBuilder implements Builder<Response, ResponseBuilder> {
  _$Response _$v;

  int _numFound;
  int get numFound => _$this._numFound;
  set numFound(int numFound) => _$this._numFound = numFound;

  int _start;
  int get start => _$this._start;
  set start(int start) => _$this._start = start;

  ListBuilder<Artifact> _artifacts;
  ListBuilder<Artifact> get artifacts =>
      _$this._artifacts ??= new ListBuilder<Artifact>();
  set artifacts(ListBuilder<Artifact> artifacts) =>
      _$this._artifacts = artifacts;

  ResponseBuilder();

  ResponseBuilder get _$this {
    if (_$v != null) {
      _numFound = _$v.numFound;
      _start = _$v.start;
      _artifacts = _$v.artifacts?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Response other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Response;
  }

  @override
  void update(void updates(ResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Response build() {
    _$Response _$result;
    try {
      _$result = _$v ??
          new _$Response._(
              numFound: numFound, start: start, artifacts: artifacts.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'artifacts';
        artifacts.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
