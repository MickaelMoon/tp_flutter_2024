import '../models/post.dart';
import '../local_posts_data_source/local_posts_data_source.dart';

class FakeLocalPostsDataSource extends LocalPostsDataSource {
  @override
  Future<List<Post>> getAllPosts() async {
    return [];
  }

  @override
  Future<Post> createPost(Post postToAdd) async {
    return postToAdd;
  }

  @override
  Future<Post> updatePost(Post newPost) async {
    return newPost;
  }

  @override
  Future<void> savePosts(List<Post> products) async {
    return;
  }
}
