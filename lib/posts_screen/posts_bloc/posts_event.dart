import '../../services/models/post.dart';

abstract class PostEvent {}

class LoadPosts extends PostEvent {}

class CreatePost extends PostEvent {
  final Post post;

  CreatePost(this.post);
}

class UpdatePost extends PostEvent {
  final Post post;

  UpdatePost(this.post);
}
