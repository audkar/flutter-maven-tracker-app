import 'package:MavenArtifactsTracker/artifact.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: SearchArtifactPage(title: 'Search artifacts'),
    );
  }
}

class SearchArtifactPage extends StatefulWidget {
  SearchArtifactPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchArtifactPageState createState() => _SearchArtifactPageState();
}

class _SearchArtifactPageState extends State<SearchArtifactPage> {
  ArtifactResponse response;
  String _searchQuery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (query) => _onQueryChanged(query),
              onSubmitted: (query) {
                _onQueryChanged(query);
                _refreshItems();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Text('Items: ${response == null ? 0 : response.numFound}'),
              ],
            ),
          ),
          buildList(response)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _refreshItems(),
        tooltip: 'Load',
        child: Icon(Icons.refresh),
      ),
    );
  }

  Widget buildList(ArtifactResponse response) {
    if (response == null) {
      return Expanded(
        child: Center(child: Text('No items')),
      );
    } else {
      return Expanded(
        child: ListView.separated(
          itemCount: response.artifacts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(response.artifacts[index].id),
              subtitle: Text(response.artifacts[index].latestVersion),
            );
          },
          separatorBuilder: (context, index) => Divider(),
        ),
      );
    }
  }

  void _onQueryChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _refreshItems() async {
    ArtifactResponse resp = await fetchArtifacts(_searchQuery);
    setState(() {
      response = resp;
    });
  }

  Future<ArtifactResponse> fetchArtifacts(String query) async {
    final response = await http
        .get("https://search.maven.org/solrsearch/select?q=$query&rows=20");
    if (response.statusCode == 200) {
      return ArtifactResponse.fromJson(
          json.jsonDecode(response.body)['response']);
    } else {
      throw Exception('Failed http artifact request');
    }
  }
}
