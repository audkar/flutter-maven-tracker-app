import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:MavenArtifactsTracker/favorite/favorite.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:flutter/rendering.dart';

class ArtifactsWidget extends StatelessWidget {
  const ArtifactsWidget({
    Key key,
    @required this.artifacts,
    @required this.favorites,
    @required this.refreshCallback,
    this.loadMoreCallback,
    this.showLoadMoreProgress = false,
    this.onFavoriteToggle,
  }) : super(key: key);

  final BuiltList<Artifact> artifacts;
  final Iterable<Favorite> favorites;
  final RefreshCallback refreshCallback;
  final LoadMoreCallback loadMoreCallback;
  final OnFavoriteToggle onFavoriteToggle;
  final bool showLoadMoreProgress;

  @override
  Widget build(BuildContext context) {
    if (artifacts.length == 0) {
      return Expanded(
        child: Center(child: Text('No items')),
      );
    } else {
      final listKey = Key('searchArtifactList');
      return Expanded(
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels >
                scrollInfo.metrics.maxScrollExtent -
                    _preloadDistancePx(context)) {
              loadMoreCallback?.call();
            }
          },
          child: RefreshIndicator(
            onRefresh: refreshCallback,
            child: ListView.separated(
              key: listKey,
              itemCount: _itemsCount(),
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: _createItem,
              separatorBuilder: (context, index) => Divider(height: 8.0),
            ),
          ),
        ),
      );
    }
  }

  Widget _createItem(context, index) {
    if (index == artifacts.length) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CircularProgressIndicator(),
      ));
    } else {
      return _createArtifactItem(context, index);
    }
  }

  Widget _createArtifactItem(context, index) {
    final key = Key('searchItem$index');
    final artifact = artifacts[index];
    final isFavorite = favorites.any((asdf) => asdf.id == artifact.id);
    return ListTile(
      key: key,
      onTap: () {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text('Click index: $index'),
          ),
        );
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            artifact.artifactName,
          ),
          Text(
            artifact.group,
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      subtitle: Column(
        children: <Widget>[
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Text('Latest version: '),
              Text(artifact.latestVersion),
            ],
          ),
          Row(
            children: <Widget>[
              Text('Last updated: '),
              Text(dateFormat.format(artifact.timestamp)),
            ],
          ),
        ],
      ),
      leading: DecoratedBox(
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: CircleBorder(),
        ),
        child: Image.asset(
          'assets/provider/maven_logo.png',
          width: 40,
          height: 40,
          fit: BoxFit.scaleDown,
        ),
      ),
      trailing: IconButton(
        icon: Icon(isFavorite ? Icons.star : Icons.star_border),
        onPressed: () => onFavoriteToggle(artifacts[index], isFavorite),
      ),
    );
  }

  int _itemsCount() {
    if (showLoadMoreProgress) {
      return artifacts.length + 1;
    } else {
      return artifacts.length;
    }
  }

  double _preloadDistancePx(BuildContext context) =>
      MediaQuery.of(context).size.height / 2;
}

typedef LoadMoreCallback = void Function();

typedef OnFavoriteToggle = void Function(Artifact artifact, bool isFavorite);

final dateFormat = DateFormat.yMMMd();
