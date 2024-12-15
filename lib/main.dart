import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'posts_screen/posts_bloc/posts_bloc.dart';
import 'posts_screen/posts_bloc/posts_event.dart';
import 'posts_screen/posts_list_screen.dart';

import 'services/posts_data_source/fake_posts_data_source.dart';
import 'services/posts_repository/posts_repository.dart';

void main() {
  // Initialisation des dépendances
  final postsDataSource = FakePostsDataSource();
  final postsRepository = PostsRepository(dataSource: postsDataSource);

  runApp(MyApp(postsRepository: postsRepository));
}

class MyApp extends StatelessWidget {
  final PostsRepository postsRepository;

  const MyApp({required this.postsRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PostBloc(repository: postsRepository)..add(LoadPosts()),
      child: MaterialApp(
        title: 'Flutter Post App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PostListScreen(),
      ),
    );
  }
}
