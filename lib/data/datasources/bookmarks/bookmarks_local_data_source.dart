import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../../../errors/error_handler.dart';
import '../../../helpers/helper_storage.dart';
import '../../models/article_model.dart';
import '../../models/news_model.dart';

abstract class BookmarkLocalDataSource {
  Future<bool> addBookmark(NewsModel news);

  Future<bool> removeBookmark(List<ArticleModel> news);

  Future<NewsModel> readBookmark();
}

const CACHED_BOOKMARK = "CACHED_BOOKMARK";

class BookmarkLocalDataSourceImpl implements BookmarkLocalDataSource {
  final StorageHelper storage;

  BookmarkLocalDataSourceImpl(this.storage);

  @override
  Future<bool> addBookmark(NewsModel news) async {
    final jsonString = await storage.read(CACHED_BOOKMARK);
    if (jsonString != null) {
      NewsModel cache = NewsModel.fromJson(json.decode(jsonString));
      final List<ArticleModel> data = news.articles;

      for (var element in cache.articles) {
        if (data[0].title.contains(element.title)) {
          return false;
        }
      }

      cache.articles = news.articles + cache.articles;

      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(
            cache.toJson(),
          ),
        ),
      );
      return true;
    } else {
      await storage.write(
        StorageItems(
          key: CACHED_BOOKMARK,
          value: json.encode(
            news.toJson(),
          ),
        ),
      );
      return true;
    }
  }

  @override
  Future<bool> removeBookmark(List<ArticleModel> news) async {
    final jsonString = await storage.read(CACHED_BOOKMARK);

    if (jsonString != null) {
      List<ArticleModel> cache = List<ArticleModel>.from(
          json.decode(jsonString).map((x) => ArticleModel.fromJson(x)));
      final List<ArticleModel> data = news;

      cache.removeWhere((element) => element.title == data[0].title);

      await storage.write(
        StorageItems(
            key: CACHED_BOOKMARK,
            value:
                json.encode(List<dynamic>.from(cache.map((x) => x.toJson())))),
      );
      return true;
    } else {
      throw CacheException();
    }
  }

  @override
  Future<NewsModel> readBookmark() async {
    final jsonString = await storage.read(CACHED_BOOKMARK);
    if (kDebugMode) {
      print("jsonString");
    }
    if (kDebugMode) {
      print(jsonString);
    }
    if (jsonString != null) {
      return NewsModel.fromJson(json.decode(jsonString));
    } else {
      throw CacheException();
    }
  }
}

// import 'package:hive/hive.dart';

// import '../../tables/article_table.dart';
//
//
//
// abstract class BookmarkLocalDataSource {
//   Future<void> saveArticle(ArticleTable articleTable);
//   Future<List<ArticleTable>> getArticles();
//   Future<void> deleteArticle(int articleId);
//   Future<bool> checkIfArticleFavorite(int articleId);
// }
//
// class BookmarkLocalDataSourceImpl extends BookmarkLocalDataSource {
//   @override
//   Future<bool> checkIfArticleFavorite(int articleId) async {
//     final articleBox = await Hive.openBox('articleBox');
//     return articleBox.containsKey(articleId);
//   }
//
//   @override
//   Future<void> deleteArticle(int articleId) async {
//     final articleBox = await Hive.openBox('articleBox');
//     await articleBox.delete(articleId);
//   }
//
//   @override
//   Future<List<ArticleTable>> getArticles() async {
//     final articleBox = await Hive.openBox('articleBox');
//     final articleIds = articleBox.keys;
//     List<ArticleTable> articles = [];
//     articleIds.forEach((articleId) {
//       final article = articleBox.get(articleId);
//       if (article != null) {
//         articles.add(articleBox.get(articleId));
//       }
//     });
//     return articles;
//   }
//
//   @override
//   Future<void> saveArticle(ArticleTable articleTable) async {
//     final articleBox = await Hive.openBox('articleBox');
//     await articleBox.put(articleTable.id, articleTable);
//   }
// }
