import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../core/core.dart';
import '../../models/article_model.dart';
import '../../models/category_model.dart';

abstract class NewsRemoteDataSource {
  Future<NewsModel> getNewGlobal({
    required bool isHeadlines,
    String? category,
    String? query,
    int? limit,
    int? page,
    DateTime? date,
  });

  Future<NewsModel> searchNewGlobal({
    // required bool isHeadlines,
    required String query,
    int? limit,
    int? page,
  });
<<<<<<< HEAD

  Future<List<CategoryModel>> getNewsCategory({
=======
  Future<NewsModel> getNewsCategory({
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    // required bool isHeadlines,
    // String? query,
    int? limit,
    int? page,
  });
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final NetworkContainer http;

  NewsRemoteDataSourceImpl({
    required this.http,
  });

  @override
  Future<NewsModel> getNewGlobal({
    required bool isHeadlines,
    String? category,
    String? query,
    int? limit,
    int? page,
    date,
  }) async {
    limit ??= 1;
    page ??= 1;
    category ??= "";
    query ??= "";
    date;
    if (isHeadlines) {
      final response = await http.method(
        path: "posts?_embed&per_page=$limit&page=$page&order=desc",
        methodType: MethodType.get,
      );

      if (response.statusCode == 200) {
<<<<<<< HEAD
        for (Map<String, dynamic> i in response.data) {
          articles.add(ArticleModel.fromJson(i));
          // print(i.toString());
        }
=======
        return NewsModel.fromJson(response.data);
        // for(Map<String, dynamic> i in response.data){
        //   articles.add(ArticleModel.fromJson(i));
        //   // print(i.toString());
        // }
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
        // print(articles);
        // return articles;
        // print(response.data);
        // return ArticleModel.fromJson(response.data);
      } else {
        if (kDebugMode) {
          print(DioError);
        }
        throw DioError;
      }
    } else {
      final response = await http.method(
        path: "posts?_embed&per_page=$limit&page=$page",
        methodType: MethodType.get,
      );

      if (response.statusCode == 200) {
<<<<<<< HEAD
        for (Map<String, dynamic> i in response.data) {
          articles.add(ArticleModel.fromJson(i));
          // print(i.toString());
        }
        // print(articles);
        return articles;
=======
        return NewsModel.fromJson(response.data);
        // for(Map<String, dynamic> i in response.data){
        //   articles.add(ArticleModel.fromJson(i));
        //   // print(i.toString());
        // }
        // // print(articles);
        // return articles;
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
        // print(response.data);
        // return ArticleModel.fromJson(response.data);
      } else {
        if (kDebugMode) {
          print(DioError);
        }
        throw DioError;
      }
    }
  }

  @override
<<<<<<< HEAD
  Future<List<CategoryModel>> getNewsCategory({int? limit, int? page}) async {
    limit ??= 20;
    page ??= 1;
    final List<CategoryModel> categories = [];
    final response = await http.method(
      path: "categories?_embed&per_page=$limit&page=$page",
      methodType: MethodType.get,
    );

    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in response.data) {
        categories.add(CategoryModel.fromJson(i));
        if (kDebugMode) {
          print(i.toString());
        }
=======
  Future<NewsModel> getNewsCategory({ int? limit, int? page}) async {
    limit ??= 1;
    page ??= 1;
    // final List<CategoryModel> categories = [];
      final response = await http.method(
        path:
        "categories",
        methodType: MethodType.get,
      );

      if (response.statusCode == 200) {
        return NewsModel.fromJson(response.data);
        // for(Map<String, dynamic> i in response.data){
        //   categories.add(CategoryModel.fromJson(i));
        //   if (kDebugMode) {
        //     print(i.toString());
        //   }
        // }
        // if (kDebugMode) {
        //   print(categories.map((e) => e.name));
        // }
        // // print(categories);
        // if (kDebugMode) {
        //   print(response.data);
        // }
        // return categories;
        // // return ArticleModel.fromJson(response.data);
      } else {
        if (kDebugMode) {
          print(DioError);
        }
        throw DioError;
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
      }
      if (kDebugMode) {
        print(categories);
      }
      // print(categories);
      if (kDebugMode) {
        print(response.data);
      }
      return categories;
      // return ArticleModel.fromJson(response.data);
    } else {
      if (kDebugMode) {
        print(DioError);
      }
      throw DioError;
    }

    // TODO: implement getNewByCategory
  }

  @override
<<<<<<< HEAD
  Future<List<ArticleModel>> searchNewGlobal(
      {required String query, int? limit, int? page}) async {
    final List<ArticleModel> articles = [];
=======
  Future<NewsModel> searchNewGlobal({required String query, int? limit, int? page}) async {
    // final NewsModel articles = [];
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    final response = await http.method(
      path: "posts?_embed&search=$query",
      methodType: MethodType.get,
    );

    if (response.statusCode == 200) {
<<<<<<< HEAD
      for (Map<String, dynamic> i in response.data) {
        articles.add(ArticleModel.fromJson(i));
        if (kDebugMode) {
          print(i.toString());
        }
        if (kDebugMode) {
          print("nothing");
        }
      }
      if (kDebugMode) {
        print(articles);
      }
      if (kDebugMode) {
        print(response.data);
      }
      if (kDebugMode) {
        print("nothing");
      }
      return articles;
      // return ArticleModel.fromJson(response.data);
=======
      // for(Map<String, dynamic> i in response.data){
      //   articles.add(ArticleModel.fromJson(i));
      //   if (kDebugMode) {
      //     print(i.toString());
      //   }
      //   if (kDebugMode) {
      //     print("nothing");
      //   }
      // }
      // if (kDebugMode) {
      //   print(articles);
      // }
      // if (kDebugMode) {
      //   print(response.data);
      // }
      // if (kDebugMode) {
      //   print("nothing");
      // }
      // return articles;
      return NewsModel.fromJson(response.data);
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    } else {
      if (kDebugMode) {
        print(DioError);
      }
      throw DioError;
    }
  }
}
