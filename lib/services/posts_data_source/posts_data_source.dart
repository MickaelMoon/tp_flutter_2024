import '../models/post.dart';

abstract class PostsDataSource {
  /// Récupérer tous les posts
  Future<List<Post>> getAllPosts();

  /// Ajouter un nouveau post
  Future<Post> createPost(Post postToAdd);

  /// Mettre à jour un post existant
  Future<Post> updatePost(Post newPost);
}
