import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../domain.dart';
import '../../entities/article_entity.dart';

class GetHeadlinesCase implements UseCase<List<ArticleEntity>, GetHeadlinesParams> {
  final NewsRepository repository;

  GetHeadlinesCase(this.repository);

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(GetHeadlinesParams params) async {
    return await repository.getNewsByHeadlines(
      limit: params.limit,
      page: params.page,
      category: params.category,
      query: params.query,
    );
  }
}

class GetHeadlinesParams extends Equatable {
  final String? category;
  final String? query;
  final int limit;
  final int page;
  const GetHeadlinesParams({
    this.category,
    this.query,
    required this.limit,
    required this.page,
  });

  @override
  List<Object?> get props => [category, query, limit, page];
}
