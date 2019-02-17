import 'package:MavenArtifactsTracker/global_dependencies_model.dart';
import 'package:MavenArtifactsTracker/home/home_page.dart';
import 'package:MavenArtifactsTracker/search/search_artifacts_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: GlobalDependenciesModel(),
      child: MaterialApp(
        title: 'Maven artifacts',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/search': (context) => SearchArtifactsPage()
        },
      ),
    );
  }
}
