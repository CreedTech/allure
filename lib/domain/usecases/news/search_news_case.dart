import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../domain.dart';
import '../../entities/article_entity.dart';

class SearchNewsCase implements UseCase<List<ArticleEntity>, SearchNewsParams> {
  final NewsRepository repository;

  SearchNewsCase(this.repository);

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(
      SearchNewsParams params) async {
    return await repository.searchNews(
      limit: params.limit,
      page: params.page,
      keyword: params.query,
    );
  }
}

class SearchNewsParams extends Equatable {
  final String query;
  final int limit;
  final int page;

  const SearchNewsParams({
    required this.query,
    required this.limit,
    required this.page,
  });

  @override
  List<Object> get props => [query, limit, page];
}
