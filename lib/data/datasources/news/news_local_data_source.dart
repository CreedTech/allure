// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


import '../../../errors/error_handler.dart';
import '../../../helpers/helper_storage.dart';
import '../../models/article_model.dart';

abstract class NewsLocalDataSource {
  Future<List<ArticleModel>> cacheTrending(List<ArticleModel> news);
  Future<List<ArticleModel>> getTrending();
  Future<List<ArticleModel>> cacheHot(List<ArticleModel> news);
  Future<List<ArticleModel>> getHotNews();
  Future<List<ArticleModel>> cacheRecommendation(List<ArticleModel> news);
  Future<List<ArticleModel>> getRecommendation();
}

const CACHE_TRENDING = 'CACHE_TRENDING';
const CACHE_RECOMMENDATION = 'CACHE_RECOMMENDATION';
const CACHE_HOT = 'CACHE_HOT';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final StorageHelper storage;
  NewsLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<List<ArticleModel>> cacheTrending(List<ArticleModel> news) async {
    await storage.write(
      StorageItems(
        key: CACHE_TRENDING,
          value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))
      ),
    );
    return news;
  }

  @override
  Future<List<ArticleModel>> getTrending() async {
    final jsonString = await storage.read(CACHE_TRENDING);
    if (jsonString != null) {
      return List<ArticleModel>.from(json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      // return ArticleModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<ArticleModel>> cacheHot(List<ArticleModel> news) async {
    await storage.write(
      StorageItems(
        key: CACHE_HOT,
          value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))
      ),
    );
    return news;
  }

  @override
  Future<List<ArticleModel>> getHotNews() async {
    final jsonString = await storage.read(CACHE_HOT);
    if (jsonString != null) {
      return List<ArticleModel>.from(json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      // return ArticleModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<ArticleModel>> cacheRecommendation(List<ArticleModel> news) async {
    await storage.write(
      StorageItems(
        key: CACHE_RECOMMENDATION,
        value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))
      ),
    );
    return news;
  }

  @override
  Future<List<ArticleModel>> getRecommendation() async {
    final jsonString = await storage.read(CACHE_RECOMMENDATION);
    if (jsonString != null) {
      return List<ArticleModel>.from(json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      // return ArticleModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }
}
