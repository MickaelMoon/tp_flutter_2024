import 'package:flutter_bloc/flutter_bloc.dart';

import '../../services/posts_repository/posts_repository.dart';
import 'posts_event.dart';
import 'posts_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostsRepository repository;

  PostBloc({required this.repository}) : super(PostsInitial()) {
    on<LoadPosts>((event, emit) async {
      emit(PostsLoading());
      try {
        final posts = await repository.getAllPosts();
        emit(PostsLoaded(posts));
      } catch (e) {
        emit(PostError('Failed to load posts: ${e.toString()}'));
      }
    });

    on<CreatePost>((event, emit) async {
      try {
        await repository.createPost(event.post);
        add(LoadPosts());
      } catch (e) {
        emit(PostError('Failed to create post: ${e.toString()}'));
      }
    });

    on<UpdatePost>((event, emit) async {
      try {
        await repository.updatePost(event.post);
        add(LoadPosts());
      } catch (e) {
        emit(PostError('Failed to update post: ${e.toString()}'));
      }
    });
  }
}
