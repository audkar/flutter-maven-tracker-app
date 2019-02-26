import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Search'),
              onPressed: () => Navigator.of(context).pushNamed('/search'),
            ),
            RaisedButton(
              child: Text('Favorite list'),
              onPressed: () =>
                  Navigator.of(context).pushNamed('/favorite_list'),
            )
          ],
        ),
      ),
    );
  }
}
