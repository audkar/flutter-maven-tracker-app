import 'package:MavenArtifactsTracker/artifact/artifacts_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';

class SearchArtifactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchArtifactsBloc bloc =
        BlocProvider.of<SearchArtifactsBloc>(context);

    return BlocBuilder<SearchArtifactsBloc, SearchArtifactsState>(
      builder: (context, state) => Scaffold(
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
                onSubmitted: (query) {
                  bloc.dispatch(ExecuteQuery(query));
                },
                textInputAction: TextInputAction.search,
              ),
            ),
            if (state is ArtifactResults)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Items: ${state.itemCount}'),
              ),
            _buildBody(state, bloc),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(
    SearchArtifactsState state,
    SearchArtifactsBloc bloc,
  ) {
    if (state is Loading) {
      return Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else if (state is ArtifactResults) {
      return _buildArtifactsWidget(state, bloc);
    } else {
      return Expanded(
        child: Center(child: Text('Enter new query')),
      );
    }
  }

  Widget _buildArtifactsWidget(
    ArtifactResults state,
    SearchArtifactsBloc bloc,
  ) {
    return ArtifactsWidget(
      artifacts: state.artifacts.toList(),
      refreshCallback: () {
        bloc.dispatch(ExecuteQuery(state.searchQuery));
        return Future<void>.value();
      },
      loadMoreCallback: state.canLoadMore
          ? () => bloc.dispatch(ExecuteQueryNextPage())
          : null,
      showLoadMoreProgress: state.isLoadingInProgress,
      onFavoriteToggle: (artifact) {
        bloc.dispatch(ToggleFavorite(artifact));
      },
    );
  }
}
