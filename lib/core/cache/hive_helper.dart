import 'package:hive/hive.dart';

class HiveHelper {
  static late Box<dynamic> cartProductDB;
  static late Box<dynamic> favoritesProductDB;
  static const _cartProductBoxDB = 'cartProductBox';
  static const _favoriteProductBoxDB = 'ProductBox';

  static Future<void> init() async {
    favoritesProductDB = await Hive.openBox(_favoriteProductBoxDB);
    cartProductDB = await Hive.openBox(_cartProductBoxDB);
  }

/*  static Future<PostModel> getPostById(int id) async {
    late PostModel postModel;
    if (savedPostsDB.containsKey(id)) {
      final jsonNewsModel = await savedPostsDB.get(id);
      postModel = PostModel.fromHive(jsonNewsModel);
    }
    return postModel;
  }

  static Future<List<PostModel>> getPostsSaved() async {
    late List<PostModel> postModel = [];
    postModel = savedPostsDB.values.map((e) => PostModel.fromHive(e)).toList();

    return postModel;
  }

  static Future<void> cacheSavedPostById(String id, PostModel postModel) async {
    final jsonNewsModel = postModel.toJsonHive();
    await savedPostsDB.put(id, jsonNewsModel);
  }

  static Future<void> deleteSavedPostById(String id) async {
    await savedPostsDB.delete(id);
  }*/
}
