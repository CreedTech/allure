import 'dart:convert';

import '../../../errors/error_handler.dart';
import '../../../helpers/helper_storage.dart';
import '../../models/article_model.dart';

abstract class BookmarkLocalDataSource {
  Future<bool> addBookmark(List<ArticleModel> news);
  Future<bool> removeBookmark(List<ArticleModel> news);
  Future<List<ArticleModel>> readBookmark();
}

const CACHED_BOOKMARK = "CACHED_BOOKMARK";

class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource {
  final StorageHelper storage;

  BookmarkLocalDataSourceImpl(this.storage);

  @override
  Future<bool> addBookmark(List<ArticleModel> news) async {
    final jsonString = await storage.read(CACHED_BOOKMARK);
    if (jsonString != null) {
      List<ArticleModel> cache = List<ArticleModel>.from(json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      final List<ArticleModel> data = news;

      for (var element in cache) {
        if (data[0].yoastHeadJson.title!.contains(element.yoastHeadJson.title!)) {
          return false;
        }
      }

      cache = news + cache;

      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(List<dynamic>.from(cache.map((x) => x.toJson())))
        ),
      );
      return true;
    } else {
      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(List<dynamic>.from(news.map((x) => x.toJson())))
        ),
      );
      return true;
    }
  }

  @override
  Future<bool> removeBookmark(List<ArticleModel> news) async {
    final jsonString = await storage.read(CACHED_BOOKMARK);

    if (jsonString != null) {
      List<ArticleModel> cache = List<ArticleModel>.from(json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      final List<ArticleModel> data = news;

      cache.removeWhere((element) => element.yoastHeadJson.title == data[0].yoastHeadJson.title);

      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(List<dynamic>.from(cache.map((x) => x.toJson())))
        ),
      );
      return true;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<List<ArticleModel>> readBookmark() async {
    final jsonString = await storage.read(CACHED_BOOKMARK);
    if (jsonString != null) {
      return List<ArticleModel>.from(json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
    } else {
      throw CacheException();
    }
  }
}
