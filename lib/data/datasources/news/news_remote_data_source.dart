import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../networks/network_dio.dart';
import '../../models/article_model.dart';
import '../../models/category_model.dart';

abstract class NewsRemoteDataSource {
  Future<List<ArticleModel>> getNewGlobal({
    required bool isHeadlines,
    String? category,
    String? query,
    int? limit,
    int? page,
    DateTime? date,
  });

  Future<List<ArticleModel>> searchNewGlobal({
    // required bool isHeadlines,
    required String query,
    int? limit,
    int? page,
  });
  Future<List<CategoryModel>> getNewsCategory({
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
  Future<List<ArticleModel>> getNewGlobal({
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
    final List<ArticleModel> articles = [];
    if (isHeadlines) {
      final response = await http.method(
        path:
        "posts?per_page=$limit&page=$page&order=desc",
        methodType: MethodType.get,
      );

      if (response.statusCode == 200) {
        for(Map<String, dynamic> i in response.data){
          articles.add(ArticleModel.fromJson(i));
          // print(i.toString());
        }
        // print(articles);
        return articles;
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
        path:
            "posts?per_page=$limit&page=$page",
        methodType: MethodType.get,
      );

      if (response.statusCode == 200) {
        for(Map<String, dynamic> i in response.data){
          articles.add(ArticleModel.fromJson(i));
          // print(i.toString());
        }
        // print(articles);
        return articles;
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
  Future<List<CategoryModel>> getNewsCategory({ int? limit, int? page}) async {
    limit ??= 1;
    page ??= 1;
    final List<CategoryModel> categories = [];
      final response = await http.method(
        path:
        "categories",
        methodType: MethodType.get,
      );

      if (response.statusCode == 200) {
        for(Map<String, dynamic> i in response.data){
          categories.add(CategoryModel.fromJson(i));
          if (kDebugMode) {
            print(i.toString());
          }
        }
        if (kDebugMode) {
          print(categories.map((e) => e.name));
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
  Future<List<ArticleModel>> searchNewGlobal({required String query, int? limit, int? page}) async {
    final List<ArticleModel> articles = [];
    final response = await http.method(
      path:
      "search?search=$query",
      methodType: MethodType.get,
    );

    if (response.statusCode == 200) {
      for(Map<String, dynamic> i in response.data){
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
    } else {
      if (kDebugMode) {
        print(DioError);
      }
      throw DioError;
    }
  }
}
