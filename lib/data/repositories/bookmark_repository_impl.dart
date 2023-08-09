import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../../domain/abstraction/bookmark_repository.dart';
import '../../domain/entitites/news_entities.dart';
<<<<<<< HEAD
import '../../errors/error.dart';
import '../../errors/error_handler.dart';
=======
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
import '../datasources/bookmarks/bookmarks_local_data_source.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkLocalDataSource localDataSource;

  BookmarkRepositoryImpl(this.localDataSource);

  @override
  Future<Either<Failure, bool>> addBookmark(NewsEntities news) async {
    try {
      final local = await localDataSource.addBookmark(news.toModel());
      return Right(local);
    } on CacheException catch (_) {
      return Left(
        CacheFailure(
          message: "Failed to add Bookmark News",
        ),
      );
    } catch (_) {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.DEFAULTERROR,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NewsEntities>> readBookmark() async {
    try {
      final local = await localDataSource.readBookmark();
      return Right(local.toEntity());
    } on CacheException {
      return Left(
        CacheFailure(
          message: "Failed to get Bookmark News",
        ),
      );
    } catch (_) {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.DEFAULTERROR,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> removeBookmark(NewsEntities news) async {
    try {
<<<<<<< HEAD
      final local =
          await localDataSource.removeBookmark(news as List<ArticleModel>);
=======
      final local = await localDataSource.removeBookmark(news.toModel());
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
      return Right(local);
    } on CacheException catch (_) {
      return Left(
        CacheFailure(
          message: "Failed to remove Bookmark News",
        ),
      );
    } catch (_) {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.DEFAULTERROR,
          ),
        ),
      );
    }
  }
}

// import 'package:allure/data/models/article_model.dart';
// import 'package:allure/domain/entities/article_entity.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../domain/abstraction/bookmark_repository.dart';
// import '../../errors/error.dart';
// import '../../errors/error_handler.dart';
// import '../datasources/bookmarks/bookmarks_local_data_source.dart';
// import '../tables/article_table.dart';
//
// class BookmarkRepositoryImpl implements BookmarkRepository {
//   final BookmarkLocalDataSource localDataSource;
//
//   BookmarkRepositoryImpl(this.localDataSource);
//   @override
//   Future<Either<Failure, void>> saveArticle(ArticleEntity news) async {
//     try {
//       final table = ArticleTable.fromArticleEntity(news);
//       final local = await localDataSource.saveArticle(ArticleTable.fromArticleEntity(news));
//       return Right(local);
//     } on CacheException catch (_) {
//       return Left(
//         CacheFailure(
//           message: "Failed to add Bookmark News",
//         ),
//       );
//     } catch (_) {
//       return Left(
//         NetworkFailure(
//           responseException: ResponseException.error(
//             type: EResponseException.DEFAULTERROR,
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   Future<Either<Failure, bool>> checkIfArticleFavorite(int articleId) async {
//     try {
//       final response = await localDataSource.checkIfArticleFavorite(articleId);
//       return Right(response);
//     } on CacheException {
//       return Left(
//         CacheFailure(
//           message: "Failed to Check if favorite",
//         ),
//       );
//     } catch (_) {
//       return Left(
//         NetworkFailure(
//           responseException: ResponseException.error(
//             type: EResponseException.DEFAULTERROR,
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   Future<Either<Failure, List<ArticleEntity>>> getFavoriteArticles() async {
//     try {
//       final local = await localDataSource.getArticles();
//       return Right(local);
//     } on CacheException {
//       return Left(
//         CacheFailure(
//           message: "Failed to get Bookmark News",
//         ),
//       );
//     } catch (_) {
//       return Left(
//         NetworkFailure(
//           responseException: ResponseException.error(
//             type: EResponseException.DEFAULTERROR,
//           ),
//         ),
//       );
//     }
//   }
//
//   @override
//   Future<Either<Failure, void>> deleteFavoriteArticle(int articleId)  async {
//     try {
//       final local = await localDataSource.deleteArticle(articleId);
//       return Right(local);
//     } on CacheException catch (_) {
//       return Left(
//         CacheFailure(
//           message: "Failed to remove Bookmark News",
//         ),
//       );
//     } catch (_) {
//       return Left(
//         NetworkFailure(
//           responseException: ResponseException.error(
//             type: EResponseException.DEFAULTERROR,
//           ),
//         ),
//       );
//     }
//   }
// }
