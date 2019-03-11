import 'package:MavenArtifactsTracker/favorite/favorite_list_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:MavenArtifactsTracker/artifacts_widget.dart';

class FavoriteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: ScopedModelDescendant<FavoriteListModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Column(
              children: <Widget>[
                Expanded(
                    flex: 1, child: Center(child: CircularProgressIndicator())),
              ],
            );
          } else {
            return _buildList(model);
          }
        },
      ),
    );
  }

  Widget _buildList(FavoriteListModel model) {
    return Column(
      children: <Widget>[
        ArtifactsWidget(
          artifacts: model.artifacts,
          favorites: model.favorites,
          refreshCallback: () => model.refresh(),
          onFavoriteToggle: (artifact, _) {
            model.removeFavorite(artifact);
          },
        ),
      ],
    );
  }
}
