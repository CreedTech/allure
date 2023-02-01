import 'package:allure/data/models/article_model.dart';
import 'package:allure/domain/entities/article_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/abstraction/bookmark_repository.dart';
import '../../errors/error.dart';
import '../../errors/error_handler.dart';
import '../datasources/bookmarks/bookmarks_local_data_source.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkLocalDataSource localDataSource;

  BookmarkRepositoryImpl(this.localDataSource);
  @override
  Future<Either<Failure, bool>> addBookmark(List<ArticleEntity> news) async {
    try {
      final local = await localDataSource.addBookmark(news as List<ArticleModel>);
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
  Future<Either<Failure, List<ArticleEntity>>> readBookmark() async {
    try {
      final local = await localDataSource.readBookmark();
      return Right(local);
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
  Future<Either<Failure, bool>> removeBookmark(List<ArticleEntity> news) async {
    try {
      final local = await localDataSource.removeBookmark(news as List<ArticleModel>);
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
