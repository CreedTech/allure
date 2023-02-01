import 'package:dartz/dartz.dart';

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../domain.dart';
import '../../entities/article_entity.dart';

class GetRecommendationCase
    implements UseCase<List<ArticleEntity>, GetRecommendationParams> {
  final NewsRepository repository;

  GetRecommendationCase(this.repository);
  @override
  Future<Either<Failure, List<ArticleEntity>>> call(
      GetRecommendationParams params) async {
    return await repository.getRecommendation(
      query: params.query,
      limit: params.limit,
      page: params.page,
    );
  }
}

class GetRecommendationParams {
  final String? query;
  final int? limit;
  final int? page;

  GetRecommendationParams({this.query, this.limit, this.page});
}
