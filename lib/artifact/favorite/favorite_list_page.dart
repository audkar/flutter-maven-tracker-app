import 'package:MavenArtifactsTracker/artifact/artifacts_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

class FavoriteListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<FavoriteListBloc>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: BlocBuilder<FavoriteListBloc, FavoriteListState>(
        builder: (context, state) {
          if (state is Loading) {
            return Column(
              children: <Widget>[
                Expanded(
                    flex: 1, child: Center(child: CircularProgressIndicator())),
              ],
            );
          } else {
            return _buildList(bloc, state);
          }
        },
      ),
    );
  }

  Widget _buildList(FavoriteListBloc bloc, ArtifactsLoaded state) {
    return Column(
      children: <Widget>[
        ArtifactsWidget(
          artifacts: state.artifacts.toList(growable: false),
          refreshCallback: () async => bloc.dispatch(Refresh()),
          onFavoriteToggle: (artifact) =>
              bloc.dispatch(RemoveFavorite(artifact)),
        ),
      ],
    );
  }
}
