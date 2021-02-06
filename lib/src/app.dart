import 'package:flutter/material.dart';
import 'package:learning_flutter_part_6/src/blocs/comments_provider.dart';
import 'package:learning_flutter_part_6/src/blocs/stories_provider.dart';
import 'package:learning_flutter_part_6/src/screens/news_detail.dart';
import 'screens/news_list.dart';

class App extends StatelessWidget {
  Widget build(context) {
    return CommentsProvider(
      child: StoriesProvider(
        child: MaterialApp(
          title: 'News!',
          onGenerateRoute: routes,
        ),
      ),
    );
  }

  Route routes(RouteSettings settings) {
    if (settings.name == '/') {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          return NewsList();
        },
      );
    } else {
      return MaterialPageRoute(
        builder: (BuildContext context) {
          final commentsBloc = CommentsProvider.of(context);
          final itemId = int.parse(settings.name.replaceFirst('/', ''));
          commentsBloc.fetchItemWithComments(itemId);
          return NewsDetail(itemId: itemId);
        },
      );
    }
  }
}
