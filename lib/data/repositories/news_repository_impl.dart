import 'package:allure/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../core/core.dart';
import '../../domain/domain.dart';
import '../datasources/news/news_local_data_source.dart';
import '../datasources/news/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsLocalDataSource localSource;
  final NewsRemoteDataSource remoteSource;
  final NetworkChecher network;

  NewsRepositoryImpl(this.localSource, this.remoteSource, this.network);

  @override
  Future<Either<Failure, NewsEntities>> getRecommendation(
      {String? query, int? limit, int? page}) async {
    if (await network.isConnected) {
      try {
        final remote = await remoteSource.getNewGlobal(
          isHeadlines: false,
          query: query ?? "",
          page: page ?? 1,
          limit: limit ?? 5,
        );
        await localSource.cacheRecommendation(remote);
        return Right(remote.toEntity());
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e);
        }
        if (kDebugMode) {
          print("Yo1");
        }
        // print(e.stackTrace);
        // print(e.message);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        if (kDebugMode) {
          print("Yo2");
        }
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      }
    } else {
      try {
        final local = await localSource.getRecommendation();
        return Right(local.toEntity());
      } on CacheException catch (_) {
        return Left(
          CacheFailure(
            message: "Failed to get Trending News",
          ),
        );
      } catch (_) {
        return Left(
          NetworkFailure(
            responseException: ResponseException.error(
              type: EResponseException.NOINTERNETCONNECTION,
            ),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, NewsEntities>> getTrending() async {
    if (await network.isConnected) {
      try {
        final remote = await remoteSource.getNewGlobal(
          isHeadlines: true,
          page: 1,
          limit: 3,
        );
        await localSource.cacheTrending(remote);
        return Right(remote.toEntity());
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e);
        }
        // print(e.stackTrace);
        // print(e.message);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        if (kDebugMode) {
          print("Yo3");
        }
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      }
    } else {
      try {
        final local = await localSource.getTrending();
        return Right(local.toEntity());
      } on CacheException catch (_) {
        return Left(
          CacheFailure(
            message: "Failed to get Trending News",
          ),
        );
      } catch (_) {
        return Left(
          NetworkFailure(
            responseException: ResponseException.error(
              type: EResponseException.NOINTERNETCONNECTION,
            ),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, NewsEntities>> searchNews({
    required String keyword,
    required int limit,
    required int page,
  }) async {
    if (await network.isConnected) {
      try {
        final remote = await remoteSource.searchNewGlobal(
          query: keyword,
          limit: limit,
          page: page,
        );
        if (kDebugMode) {
          print(remote);
        }
        return Right(remote.toEntity());
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e);
        }
        if (kDebugMode) {
          print("Yo4");
        }
        // print(e.stackTrace);
        // print(e.message);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      } catch (e) {
        print(e);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      }
    } else {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.NOINTERNETCONNECTION,
          ),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, NewsEntities>> getHotNews() async {
    if (await network.isConnected) {
      try {
        final remote = await remoteSource.getNewGlobal(
          isHeadlines: true,
          page: 3,
          limit: 5,
        );
        // top-headlines?category=general&language=$language&pageSize=5&page=3&apiKey=$key
        await localSource.cacheHot(remote);
        return Right(remote.toEntity());
      } on DioError catch (e) {
        // // print(e);
        // print(e.stackTrace);
        // print(e.message);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      } catch (e) {
        print(e);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      }
    } else {
      try {
        final local = await localSource.getHotNews();
        return Right(local.toEntity());
      } on CacheException catch (_) {
        return Left(
          CacheFailure(
            message: "Failed to get Trending News",
          ),
        );
      } catch (_) {
        return Left(
          NetworkFailure(
            responseException: ResponseException.error(
              type: EResponseException.NOINTERNETCONNECTION,
            ),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, NewsEntities>> getNewsByHeadlines({
    String? category,
    String? query,
    required int limit,
    required int page,
  }) async {
    if (await network.isConnected) {
      try {
        final remote = await remoteSource.getNewGlobal(
          isHeadlines: true,
          category: category,
          query: query,
          limit: limit,
          page: page,
        );
        return Right(remote.toEntity());
      } on DioError catch (e) {
        // print(e);
        // print(e.stackTrace);
        // print(e.message);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      } catch (e) {
        print(e);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      }
    } else {
      return Left(
        NetworkFailure(
          responseException: ResponseException.error(
            type: EResponseException.NOINTERNETCONNECTION,
          ),
        ),
      );
    }
  }

  @override
<<<<<<< HEAD
  Future<Either<Failure, List<CategoryEntity>>> getNewsCategory(
      {required int limit, required int page}) async {
    if (await network.isConnected) {
      try {
        final remote = await remoteSource.getNewsCategory(
          page: 1,
          limit: 100,
        );
        // await localSource.cacheTrending(remote);
        return Right(remote);
      } on DioError catch (e) {
        if (kDebugMode) {
          print(e);
        }
        // print(e.stackTrace);
        // print(e.message);
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
        if (kDebugMode) {
          print("Yo");
        }
        return Left(
          NetworkFailure(
            responseException: ResponseException.getDioException(e),
          ),
        );
      }
    } else {
      try {
        final local = await localSource.getCategory();
        return Right(local);
      } on CacheException catch (_) {
        return Left(
          CacheFailure(
            message: "Failed to get Trending News",
          ),
        );
      } catch (_) {
        return Left(
          NetworkFailure(
            responseException: ResponseException.error(
              type: EResponseException.NOINTERNETCONNECTION,
            ),
          ),
        );
      }
    }
=======
  Future<Either<Failure, NewsEntities>> getNewsCategory({String? category, String? query, required int limit, required int page}) {
    // TODO: implement getNewsCategory
    throw UnimplementedError();
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
  }
}
