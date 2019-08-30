// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_artifacts_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract class SearchArtifactsStateBuilder {
  void replace(SearchArtifactsState other);
  void update(void Function(SearchArtifactsStateBuilder) updates);
  ListBuilder<Favorite> get favorites;
  set favorites(ListBuilder<Favorite> favorites);
}

class _$Initial extends Initial {
  @override
  final BuiltList<Favorite> favorites;

  factory _$Initial([void Function(InitialBuilder) updates]) =>
      (new InitialBuilder()..update(updates)).build();

  _$Initial._({this.favorites}) : super._() {
    if (favorites == null) {
      throw new BuiltValueNullFieldError('Initial', 'favorites');
    }
  }

  @override
  Initial rebuild(void Function(InitialBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InitialBuilder toBuilder() => new InitialBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Initial && favorites == other.favorites;
  }

  @override
  int get hashCode {
    return $jf($jc(0, favorites.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Initial')..add('favorites', favorites))
        .toString();
  }
}

class InitialBuilder
    implements Builder<Initial, InitialBuilder>, SearchArtifactsStateBuilder {
  _$Initial _$v;

  ListBuilder<Favorite> _favorites;
  ListBuilder<Favorite> get favorites =>
      _$this._favorites ??= new ListBuilder<Favorite>();
  set favorites(ListBuilder<Favorite> favorites) =>
      _$this._favorites = favorites;

  InitialBuilder();

  InitialBuilder get _$this {
    if (_$v != null) {
      _favorites = _$v.favorites?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant Initial other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Initial;
  }

  @override
  void update(void Function(InitialBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Initial build() {
    _$Initial _$result;
    try {
      _$result = _$v ?? new _$Initial._(favorites: favorites.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'favorites';
        favorites.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Initial', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
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
    implements Builder<Loading, LoadingBuilder>, SearchArtifactsStateBuilder {
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

class _$ArtifactResults extends ArtifactResults {
  @override
  final String searchQuery;
  @override
  final Page artifactsPage;
  @override
  final BuiltList<ArtifactModel> artifacts;
  @override
  final bool isLoadingInProgress;
  @override
  final bool canLoadMore;
  @override
  final BuiltList<Favorite> favorites;

  factory _$ArtifactResults([void Function(ArtifactResultsBuilder) updates]) =>
      (new ArtifactResultsBuilder()..update(updates)).build();

  _$ArtifactResults._(
      {this.searchQuery,
      this.artifactsPage,
      this.artifacts,
      this.isLoadingInProgress,
      this.canLoadMore,
      this.favorites})
      : super._() {
    if (searchQuery == null) {
      throw new BuiltValueNullFieldError('ArtifactResults', 'searchQuery');
    }
    if (artifactsPage == null) {
      throw new BuiltValueNullFieldError('ArtifactResults', 'artifactsPage');
    }
    if (artifacts == null) {
      throw new BuiltValueNullFieldError('ArtifactResults', 'artifacts');
    }
    if (isLoadingInProgress == null) {
      throw new BuiltValueNullFieldError(
          'ArtifactResults', 'isLoadingInProgress');
    }
    if (canLoadMore == null) {
      throw new BuiltValueNullFieldError('ArtifactResults', 'canLoadMore');
    }
    if (favorites == null) {
      throw new BuiltValueNullFieldError('ArtifactResults', 'favorites');
    }
  }

  @override
  ArtifactResults rebuild(void Function(ArtifactResultsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ArtifactResultsBuilder toBuilder() =>
      new ArtifactResultsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ArtifactResults &&
        searchQuery == other.searchQuery &&
        artifactsPage == other.artifactsPage &&
        artifacts == other.artifacts &&
        isLoadingInProgress == other.isLoadingInProgress &&
        canLoadMore == other.canLoadMore &&
        favorites == other.favorites;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, searchQuery.hashCode), artifactsPage.hashCode),
                    artifacts.hashCode),
                isLoadingInProgress.hashCode),
            canLoadMore.hashCode),
        favorites.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ArtifactResults')
          ..add('searchQuery', searchQuery)
          ..add('artifactsPage', artifactsPage)
          ..add('artifacts', artifacts)
          ..add('isLoadingInProgress', isLoadingInProgress)
          ..add('canLoadMore', canLoadMore)
          ..add('favorites', favorites))
        .toString();
  }
}

class ArtifactResultsBuilder
    implements
        Builder<ArtifactResults, ArtifactResultsBuilder>,
        SearchArtifactsStateBuilder {
  _$ArtifactResults _$v;

  String _searchQuery;
  String get searchQuery => _$this._searchQuery;
  set searchQuery(String searchQuery) => _$this._searchQuery = searchQuery;

  Page _artifactsPage;
  Page get artifactsPage => _$this._artifactsPage;
  set artifactsPage(Page artifactsPage) =>
      _$this._artifactsPage = artifactsPage;

  ListBuilder<ArtifactModel> _artifacts;
  ListBuilder<ArtifactModel> get artifacts =>
      _$this._artifacts ??= new ListBuilder<ArtifactModel>();
  set artifacts(ListBuilder<ArtifactModel> artifacts) =>
      _$this._artifacts = artifacts;

  bool _isLoadingInProgress;
  bool get isLoadingInProgress => _$this._isLoadingInProgress;
  set isLoadingInProgress(bool isLoadingInProgress) =>
      _$this._isLoadingInProgress = isLoadingInProgress;

  bool _canLoadMore;
  bool get canLoadMore => _$this._canLoadMore;
  set canLoadMore(bool canLoadMore) => _$this._canLoadMore = canLoadMore;

  ListBuilder<Favorite> _favorites;
  ListBuilder<Favorite> get favorites =>
      _$this._favorites ??= new ListBuilder<Favorite>();
  set favorites(ListBuilder<Favorite> favorites) =>
      _$this._favorites = favorites;

  ArtifactResultsBuilder();

  ArtifactResultsBuilder get _$this {
    if (_$v != null) {
      _searchQuery = _$v.searchQuery;
      _artifactsPage = _$v.artifactsPage;
      _artifacts = _$v.artifacts?.toBuilder();
      _isLoadingInProgress = _$v.isLoadingInProgress;
      _canLoadMore = _$v.canLoadMore;
      _favorites = _$v.favorites?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ArtifactResults other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ArtifactResults;
  }

  @override
  void update(void Function(ArtifactResultsBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ArtifactResults build() {
    _$ArtifactResults _$result;
    try {
      _$result = _$v ??
          new _$ArtifactResults._(
              searchQuery: searchQuery,
              artifactsPage: artifactsPage,
              artifacts: artifacts.build(),
              isLoadingInProgress: isLoadingInProgress,
              canLoadMore: canLoadMore,
              favorites: favorites.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'artifacts';
        artifacts.build();

        _$failedField = 'favorites';
        favorites.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ArtifactResults', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
