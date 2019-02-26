import 'package:MavenArtifactsTracker/global_dependencies_model.dart';
import 'package:MavenArtifactsTracker/search/search_artifacts_model.dart';
import 'package:MavenArtifactsTracker/search/search_artifacts_widget.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SearchArtifactsPage extends StatefulWidget {
  SearchArtifactsPage({Key key}) : super(key: key);

  @override
  _SearchArtifactsPageState createState() => _SearchArtifactsPageState();
}

class _SearchArtifactsPageState extends State<SearchArtifactsPage> {
  SearchArtifactsModel _model;

  @override
  void initState() {
    super.initState();
    final dependencies = ScopedModel.of<GlobalDependenciesModel>(context);
    _model = SearchArtifactsModel(
      mavenApi: dependencies.mavenApi,
      favoriteRepository: dependencies.favoriteRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: _model,
      child: SearchArtifactsWidget(),
    );
  }
}
