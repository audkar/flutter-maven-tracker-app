import 'package:MavenArtifactsTracker/artifact/favorite/bloc/bloc.dart';
import 'package:MavenArtifactsTracker/artifact/favorite/favorite_list_page.dart';
import 'package:MavenArtifactsTracker/artifact/search/bloc/bloc.dart';
import 'package:MavenArtifactsTracker/artifact/search/search_artifacts_page.dart';
import 'package:MavenArtifactsTracker/data/favorite/favorite_persistor.dart';
import 'package:MavenArtifactsTracker/data/favorite/repository.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/maven_api.dart';
import 'package:MavenArtifactsTracker/data/searchartifact/repository.dart';
import 'package:MavenArtifactsTracker/home/home_page.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BlocSupervisor.delegate = _LoggingBlocDelegate();
    return MultiRepositoryProvider(
      providers: <RepositoryProvider>[
        RepositoryProvider<FavoriteRepository>(
          builder: (BuildContext context) => InMemoryFavoriteRepository(
              favoritesPersistor: SharedPrefFavoritePersistor()),
        ),
        RepositoryProvider<SearchArtifactRepository>(
            builder: (BuildContext context) =>
                SearchArtifactRepository(MavenApi.central())),
      ],
      child: MaterialApp(
        title: 'Maven artifacts',
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/search': (context) => BlocProvider<SearchArtifactsBloc>(
                builder: (context) => SearchArtifactsBloc(
                  RepositoryProvider.of(context),
                  RepositoryProvider.of(context),
                ),
                child: SearchArtifactsPage(),
              ),
          '/favorite_list': (context) => BlocProvider<FavoriteListBloc>(
                builder: (context) => FavoriteListBloc(
                  RepositoryProvider.of(context),
                  RepositoryProvider.of(context),
                ),
                child: FavoriteListPage(),
              ),
        },
      ),
    );
  }
}

class _LoggingBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    debugPrint('Bloc[${_s(bloc)}] event: ${_s(event)}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    final transitionStr =
        "Transition { currentState: ${_s(transition.currentState)}, "
        "event: ${_s(transition.event)}, "
        "nextState: ${_s(transition.nextState)}";
    debugPrint('Bloc[${_s(bloc)}] transition: $transitionStr');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    debugPrint('Bloc[${_s(bloc)}] error: $error');
  }

  String _s(Object bloc) => bloc.runtimeType.toString();
}
