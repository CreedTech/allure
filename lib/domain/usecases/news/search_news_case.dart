import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class SearchNewsCase implements UseCase<NewsEntities, SearchNewsParams> {
  final NewsRepository repository;

  SearchNewsCase(this.repository);

  @override
<<<<<<< HEAD
  Future<Either<Failure, List<ArticleEntity>>> call(
      SearchNewsParams params) async {
=======
  Future<Either<Failure, NewsEntities>> call(SearchNewsParams params) async {
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
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
