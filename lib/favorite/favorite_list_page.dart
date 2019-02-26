import 'package:MavenArtifactsTracker/favorite/favorite_list_model.dart';
import 'package:MavenArtifactsTracker/favorite/favorite_list_widget.dart';
import 'package:MavenArtifactsTracker/global_dependencies_model.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class FavoriteListPage extends StatefulWidget {
  @override
  _FavoriteListPageState createState() => _FavoriteListPageState();
}

class _FavoriteListPageState extends State<FavoriteListPage> {
  FavoriteListModel _model;

  @override
  void initState() {
    super.initState();
    final dependencies = ScopedModel.of<GlobalDependenciesModel>(context);
    _model = FavoriteListModel(
      mavenApi: dependencies.mavenApi,
      repository: dependencies.favoriteRepository,
    );
  }

  @override
  Widget build(BuildContext context) => ScopedModel(
        model: _model,
        child: FavoriteListWidget(),
      );

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
}
