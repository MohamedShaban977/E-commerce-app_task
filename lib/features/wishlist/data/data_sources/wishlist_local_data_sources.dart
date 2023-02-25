import 'package:e_commerce_app_task/features/product_details/data/models/product_details_response.dart';
import 'package:hive/hive.dart';

import '../tables/product_favorite_table.dart';

abstract class WishlistLocalDataSource {
  Future<List<ProductFavoriteTable>> getAllProducts();

  Future<ProductFavoriteTable> getProductById(int id);

  Future<void> saveProductById(ProductFavoriteTable product);

  Future<void> deleteProductById(int id);

  Future<bool> checkIfProductFavorite(int id);
}

class WishlistLocalDataSourceImpl implements WishlistLocalDataSource {
  static const _productBox = 'ProductBox';

  Future<Box<dynamic>> _openBox() async => await Hive.openBox(_productBox);

  @override
  Future<void> saveProductById(ProductFavoriteTable product) async {
    final productBox = await _openBox();
    if(productBox.containsKey(product.id)) return ;
    await productBox.put(product.id, product);
  }

  @override
  Future<List<ProductFavoriteTable>> getAllProducts() async {
    final productBox = await _openBox();
    final productIds = productBox.keys;
    List<ProductFavoriteTable> products = [];
    for (var productId in productIds) {
      products.add(productBox.get(productId));
    }
    return products;
  }

  @override
  Future<ProductFavoriteTable> getProductById(int id) async {
    final productBox = await _openBox();

    late  ProductFavoriteTable productTable ;
    if (productBox.containsKey(id)) {
      final product = await productBox.get(id);
      productTable = ProductFavoriteTable.fromEntity(product);
    }
    return productTable;
  }

  @override
  Future<void> deleteProductById(int id) async {
    final productBox = await _openBox();
    await productBox.delete(id);
  }

  @override
  Future<bool> checkIfProductFavorite(int id) async {
    final productBox = await _openBox();
    return productBox.containsKey(id);
  }

// @override
// Future<QuoteModel> getLastRandomQuote() {
//   final jsonString =
//   sharedPreferences.getString(AppStrings.cachedRandomQuote);
//   if (jsonString != null) {
//     final cacheRandomQuote =
//     Future.value(QuoteModel.fromJson(json.decode(jsonString)));
//     return cacheRandomQuote;
//   } else {
//     throw CacheException();
//   }
// }
//
// @override
// Future<void> cacheQuote(QuoteModel quote) {
//   return sharedPreferences.setString(
//       AppStrings.cachedRandomQuote, json.encode(quote));
// }

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

//
// //1
// abstract class MovieLocalDataSource {
//   //2
//   Future<void> saveMovie(MovieTable movieTable);
//   //3
//   Future<List<MovieTable>> getMovies();
//   //4
//   Future<void> deleteMovie(int movieId);
//   //5
//   Future<bool> checkIfMovieFavorite(int movieId);
// }

// //1
// class MovieLocalDataSourceImpl extends MovieLocalDataSource {
//   @override
//   Future<bool> checkIfMovieFavorite(int movieId) async {
//     final movieBox = await Hive.openBox('movieBox');
// //1
//     return movieBox.containsKey(movieId);
//   }
//
//   @override
//   Future<void> deleteMovie(int movieId) async {
//     //1
//     final movieBox = await Hive.openBox('movieBox');
// //2
//     await movieBox.delete(movieId);
//   }

// @override
// Future<List<MovieTable>> getMovies() async {
//   //1
//   final movieBox = await Hive.openBox('movieBox');
//   //2
//   final movieIds = movieBox.keys;
//   //3
//   List<MovieTable> movies = [];
//   //4
//   movieIds.forEach((movieId) {
//     movies.add(movieBox.get(movieId));
//   });
//   //5
//   return movies;
// }

//
//   @override
//   Future<void> saveMovie(MovieTable movieTable) async {
//     //1
//     final movieBox = await Hive.openBox('movieBox');
//     //2
//     await movieBox.put(movieTable.id, movieTable);
//   }
//
// }

// class MovieRepositoryImpl {
// //1
// final MovieLocalDataSource localDataSource;
//
// //2
// MovieRepositoryImpl(this.remoteDataSource, this.localDataSource);
//
// @override
// Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity) async {
//   try {
//     //3
//     final response = await localDataSource.saveMovie(MovieTable.fromMovieEntity(movieEntity);
//         //4
//         return Right(response);
//   } on Exception {
//     //5
//     return Left();
//   }
// }
