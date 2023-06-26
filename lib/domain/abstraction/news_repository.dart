import 'package:allure/domain/entities/category_entity.dart';
import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/article_entity.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<ArticleEntity>>> getTrending();

  Future<Either<Failure, List<ArticleEntity>>> searchNews({
    required String keyword,
    required int limit,
    required int page,
  });

  Future<Either<Failure, List<ArticleEntity>>> getRecommendation({
    String? query,
    int? limit,
    int? page,
  });

  Future<Either<Failure, List<ArticleEntity>>> getHotNews();

  Future<Either<Failure, List<ArticleEntity>>> getNewsByHeadlines({
    String? category,
    String? query,
    required int limit,
    required int page,
  });

  Future<Either<Failure, List<CategoryEntity>>> getNewsCategory({
    required int limit,
    required int page,
  });
// Future<Either<Failure, ArticleDetailEntity>> getArticleDetail(int id);
}
