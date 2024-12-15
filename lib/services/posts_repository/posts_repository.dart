import '../models/post.dart';
import '../posts_data_source/posts_data_source.dart';

class PostsRepository {
  final PostsDataSource dataSource;

  PostsRepository({required this.dataSource});

  /// Récupère tous les posts depuis la source de données
  Future<List<Post>> getAllPosts() async {
    return await dataSource.getAllPosts();
  }

  /// Ajoute un nouveau post
  Future<Post> createPost(Post postToAdd) async {
    return await dataSource.createPost(postToAdd);
  }

  /// Met à jour un post existant
  Future<Post> updatePost(Post newPost) async {
    return await dataSource.updatePost(newPost);
  }
}
