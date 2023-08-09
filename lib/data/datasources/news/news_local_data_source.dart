// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

<<<<<<< HEAD
import 'package:allure/data/models/category_model.dart';import '../../../errors/error_handler.dart';
import '../../../helpers/helper_storage.dart';
import '../../models/article_model.dart';

abstract class NewsLocalDataSource {
  Future<List<ArticleModel>> cacheTrending(List<ArticleModel> news);

  Future<List<ArticleModel>> getTrending();

  Future<List<CategoryModel>> cacheCategory(List<CategoryModel> news);

  Future<List<CategoryModel>> getCategory();

  Future<List<ArticleModel>> cacheHot(List<ArticleModel> news);

  Future<List<ArticleModel>> getHotNews();

  Future<List<ArticleModel>> cacheRecommendation(List<ArticleModel> news);

  Future<List<ArticleModel>> getRecommendation();
=======

import '../../../core/core.dart';
import '../../models/article_model.dart';

abstract class NewsLocalDataSource {
  Future<void> cacheTrending(NewsModel news);
  Future<NewsModel> getTrending();
  Future<void> cacheHot(NewsModel news);
  Future<NewsModel> getHotNews();
  Future<void> cacheRecommendation(NewsModel news);
  Future<NewsModel> getRecommendation();
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
}

const CACHE_TRENDING = 'CACHE_TRENDING';
const CACHE_CATEGORY = 'CACHE_CATEGORY';
const CACHE_RECOMMENDATION = 'CACHE_RECOMMENDATION';
const CACHE_HOT = 'CACHE_HOT';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final StorageHelper storage;

  NewsLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<NewsModel> cacheTrending(NewsModel news) async {
    await storage.write(
      StorageItems(
<<<<<<< HEAD
          key: CACHE_TRENDING,
          value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))),
=======
        key: CACHE_TRENDING,
        value: json.encode(
          news.toJson(),
        ),
      ),
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    );
    return news;
  }

  @override
  Future<NewsModel> getTrending() async {
    final jsonString = await storage.read(CACHE_TRENDING);
    if (jsonString != null) {
<<<<<<< HEAD
      return List<ArticleModel>.from(
          json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      // return ArticleModel.fromJson(json.decode(jsonString));
=======
      return NewsModel.fromJson(json.decode(jsonString));
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheHot(NewsModel news) async {
    await storage.write(
      StorageItems(
<<<<<<< HEAD
          key: CACHE_HOT,
          value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))),
=======
        key: CACHE_HOT,
        value: json.encode(
          news.toJson(),
        ),
      ),
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    );
    return;
  }

  @override
  Future<NewsModel> getHotNews() async {
    final jsonString = await storage.read(CACHE_HOT);
    if (jsonString != null) {
<<<<<<< HEAD
      return List<ArticleModel>.from(
          json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      // return ArticleModel.fromJson(json.decode(jsonString));
=======
      return NewsModel.fromJson(json.decode(jsonString));
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    } else {
      throw CacheException();
    }
  }

  @override
<<<<<<< HEAD
  Future<List<ArticleModel>> cacheRecommendation(
      List<ArticleModel> news) async {
    await storage.write(
      StorageItems(
          key: CACHE_RECOMMENDATION,
          value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))),
=======
  Future<void> cacheRecommendation(NewsModel news) async {
    await storage.write(
      StorageItems(
        key: CACHE_RECOMMENDATION,
        value: json.encode(
          news.toJson(),
        ),
      ),
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    );
    return;
  }

  @override
  Future<NewsModel> getRecommendation() async {
    final jsonString = await storage.read(CACHE_RECOMMENDATION);
    if (jsonString != null) {
<<<<<<< HEAD
      return List<ArticleModel>.from(
          json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      // return ArticleModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<CategoryModel>> cacheCategory(List<CategoryModel> news) async {
    await storage.write(
      StorageItems(
          key: CACHE_CATEGORY,
          value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))),
    );
    return news;
  }

  @override
  Future<List<CategoryModel>> getCategory() async {
    final jsonString = await storage.read(CACHE_CATEGORY);
    if (jsonString != null) {
      return List<CategoryModel>.from(
          json.decode(jsonString).map((x) => CategoryModel.fromJson(x)));
      // return ArticleModel.fromJson(json.decode(jsonString));
=======
      return NewsModel.fromJson(json.decode(jsonString));
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    } else {
      throw CacheException();
    }
  }
}
