import 'package:MavenArtifactsTracker/data/searchartifact/maven_api.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:MavenArtifactsTracker/utils/pagination/page.dart';
import 'package:flutter/foundation.dart';
import 'package:tuple/tuple.dart';

class SearchArtifactRepository {
  final MavenApi _mavenApi;

  SearchArtifactRepository(this._mavenApi);

  Future<Tuple2<Page, Iterable<SearchArtifact>>> fetchArtifactsPaged({
    @required String query,
    Page previousPage,
    @required int itemsPerPage,
  }) {
    final page = previousPage ?? Page.initial();

    return _mavenApi
        .fetchArtifacts(query, page.nextPageIndex * itemsPerPage, itemsPerPage)
        .then((response) {
      final artifacts =
          response.response.artifacts.map((it) => SearchArtifact.from(it));
      final newPage = Page(
        totalItemCount: response.response.numFound,
        itemCount: page.itemCount + artifacts.length,
        currentPage: page.nextPageIndex,
      );
      return Tuple2(newPage, artifacts);
    });
  }
}
