import '../../services/models/post.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../posts_bloc/posts_bloc.dart';
import '../posts_bloc/posts_event.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController(text: post.title);
    final descriptionController = TextEditingController(text: post.description);

    return Scaffold(
      appBar: AppBar(title: Text('Post Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedPost = Post(
                  id: post.id,
                  title: titleController.text,
                  description: descriptionController.text,
                );
                context.read<PostBloc>().add(UpdatePost(updatedPost));
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            )
          ],
        ),
      ),
    );
  }
}
