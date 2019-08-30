// GENERATED CODE - DO NOT MODIFY BY HAND

part of favorite_list_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class FavoriteListStateBuilder {
  void replace(FavoriteListState other);
  void update(void Function(FavoriteListStateBuilder) updates);
  ListBuilder<Favorite> get favorites;
  set favorites(ListBuilder<Favorite> favorites);
}

class _$Loading extends Loading {
  @override
  final BuiltList<Favorite> favorites;

  factory _$Loading([void Function(LoadingBuilder) updates]) =>
      (new LoadingBuilder()..update(updates)).build();

  _$Loading._({this.favorites}) : super._() {
    if (favorites == null) {
      throw new BuiltValueNullFieldError('Loading', 'favorites');
    }
  }

  @override
  Loading rebuild(void Function(LoadingBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoadingBuilder toBuilder() => new LoadingBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Loading && favorites == other.favorites;
  }

  @override
  int get hashCode {
    return $jf($jc(0, favorites.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Loading')..add('favorites', favorites))
        .toString();
  }
}

class LoadingBuilder
    implements Builder<Loading, LoadingBuilder>, FavoriteListStateBuilder {
  _$Loading _$v;

  ListBuilder<Favorite> _favorites;
  ListBuilder<Favorite> get favorites =>
      _$this._favorites ??= new ListBuilder<Favorite>();
  set favorites(ListBuilder<Favorite> favorites) =>
      _$this._favorites = favorites;

  LoadingBuilder();

  LoadingBuilder get _$this {
    if (_$v != null) {
      _favorites = _$v.favorites?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Loading other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Loading;
  }

  @override
  void update(void Function(LoadingBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Loading build() {
    _$Loading _$result;
    try {
      _$result = _$v ?? new _$Loading._(favorites: favorites.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favorites';
        favorites.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Loading', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ArtifactsLoaded extends ArtifactsLoaded {
  @override
  final BuiltList<ArtifactModel> artifacts;
  @override
  final BuiltList<Favorite> favorites;

  factory _$ArtifactsLoaded([void Function(ArtifactsLoadedBuilder) updates]) =>
      (new ArtifactsLoadedBuilder()..update(updates)).build();

  _$ArtifactsLoaded._({this.artifacts, this.favorites}) : super._() {
    if (artifacts == null) {
      throw new BuiltValueNullFieldError('ArtifactsLoaded', 'artifacts');
    }
    if (favorites == null) {
      throw new BuiltValueNullFieldError('ArtifactsLoaded', 'favorites');
    }
  }

  @override
  ArtifactsLoaded rebuild(void Function(ArtifactsLoadedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtifactsLoadedBuilder toBuilder() =>
      new ArtifactsLoadedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtifactsLoaded &&
        artifacts == other.artifacts &&
        favorites == other.favorites;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, artifacts.hashCode), favorites.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArtifactsLoaded')
          ..add('artifacts', artifacts)
          ..add('favorites', favorites))
        .toString();
  }
}

class ArtifactsLoadedBuilder
    implements
        Builder<ArtifactsLoaded, ArtifactsLoadedBuilder>,
        FavoriteListStateBuilder {
  _$ArtifactsLoaded _$v;

  ListBuilder<ArtifactModel> _artifacts;
  ListBuilder<ArtifactModel> get artifacts =>
      _$this._artifacts ??= new ListBuilder<ArtifactModel>();
  set artifacts(ListBuilder<ArtifactModel> artifacts) =>
      _$this._artifacts = artifacts;

  ListBuilder<Favorite> _favorites;
  ListBuilder<Favorite> get favorites =>
      _$this._favorites ??= new ListBuilder<Favorite>();
  set favorites(ListBuilder<Favorite> favorites) =>
      _$this._favorites = favorites;

  ArtifactsLoadedBuilder();

  ArtifactsLoadedBuilder get _$this {
    if (_$v != null) {
      _artifacts = _$v.artifacts?.toBuilder();
      _favorites = _$v.favorites?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ArtifactsLoaded other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArtifactsLoaded;
  }

  @override
  void update(void Function(ArtifactsLoadedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArtifactsLoaded build() {
    _$ArtifactsLoaded _$result;
    try {
      _$result = _$v ??
          new _$ArtifactsLoaded._(
              artifacts: artifacts.build(), favorites: favorites.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'artifacts';
        artifacts.build();
        _$failedField = 'favorites';
        favorites.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArtifactsLoaded', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
