import 'package:MavenArtifactsTracker/artifacts_widget.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_repository.dart';
import 'package:MavenArtifactsTracker/search/search_artifacts_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchArtifactsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchArtifactsModel model =
        ScopedModel.of<SearchArtifactsModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Search artifacts'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Artifact name',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              onChanged: (query) => model.changeQuery(query),
              onSubmitted: (query) {
                model.refreshItems();
              },
              textInputAction: TextInputAction.search,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ScopedModelDescendant<SearchArtifactsModel>(
                builder: (context, widget, model) =>
                    Text('Items: ${model.itemCount}')),
          ),
          ScopedModelDescendant<SearchArtifactsModel>(
            builder: (context, widget, model) {
              if (model.inProgress && model.artifacts.length == 0) {
                return Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return _buildArtifactsWidget(model);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildArtifactsWidget(SearchArtifactsModel model) {
    return StreamBuilder<Iterable<Favorite>>(
        initialData: [],
        stream: model.favorites,
        builder: (
          BuildContext context,
          AsyncSnapshot<Iterable<Favorite>> snapshot,
        ) {
          return ArtifactsWidget(
            artifacts: model.artifacts,
            favorites: snapshot.data ?? Iterable.empty(),
            refreshCallback: () {
              model.refreshItems();
              return Future<void>.value();
            },
            loadMoreCallback: () {
              if (!model.inProgress && model.hasMoreItems) {
                model.loadNextPage();
              }
            },
            showLoadMoreProgress: model.hasMoreItems,
            onFavoriteToggle: (artifact, isFavorite) {
              model.onFavoriteToggle(artifact, isFavorite);
            },
          );
        });
  }
}
