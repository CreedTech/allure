import 'package:allure/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../entitites/news_entities.dart';

abstract class NewsRepository {
<<<<<<< HEAD
  Future<Either<Failure, List<ArticleEntity>>> getTrending();

  Future<Either<Failure, List<ArticleEntity>>> searchNews({
=======
  Future<Either<Failure, NewsEntities>> getTrending();
  Future<Either<Failure, NewsEntities>> searchNews({
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    required String keyword,
    required int limit,
    required int page,
  });
<<<<<<< HEAD

  Future<Either<Failure, List<ArticleEntity>>> getRecommendation({
=======
  Future<Either<Failure, NewsEntities>> getRecommendation({
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    String? query,
    int? limit,
    int? page,
  });
<<<<<<< HEAD

  Future<Either<Failure, List<ArticleEntity>>> getHotNews();

  Future<Either<Failure, List<ArticleEntity>>> getNewsByHeadlines({
=======
  Future<Either<Failure, NewsEntities>> getHotNews();
  Future<Either<Failure, NewsEntities>> getNewsByHeadlines({
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    String? category,
    String? query,
    required int limit,
    required int page,
  });
<<<<<<< HEAD

  Future<Either<Failure, List<CategoryEntity>>> getNewsCategory({
=======
  Future<Either<Failure, NewsEntities>> getNewsCategory({
    String? category,
    String? query,
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
    required int limit,
    required int page,
  });
// Future<Either<Failure, ArticleDetailEntity>> getArticleDetail(int id);
}
