import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'posts_bloc/posts_bloc.dart';
import 'posts_bloc/posts_state.dart';
import 'posts_create_screen/posts_create_screen.dart';
import 'posts_detail_screen/posts_detail_screen.dart';

class PostListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostsLoaded) {
            if (state.posts.isEmpty) {
              return Center(child: Text('No posts available'));
            }
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('Press the button to load posts.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePostScreen()),
          );
        },
      ),
    );
  }
}
