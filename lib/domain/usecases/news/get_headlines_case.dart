import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
<<<<<<< HEAD

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
=======
import '../../../core/core.dart';
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
import '../../domain.dart';

<<<<<<< HEAD
class GetHeadlinesCase
    implements UseCase<List<ArticleEntity>, GetHeadlinesParams> {
=======
class GetHeadlinesCase implements UseCase<NewsEntities, GetHeadlinesParams> {
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
  final NewsRepository repository;

  GetHeadlinesCase(this.repository);

  @override
<<<<<<< HEAD
  Future<Either<Failure, List<ArticleEntity>>> call(
      GetHeadlinesParams params) async {
=======
  Future<Either<Failure, NewsEntities>> call(GetHeadlinesParams params) async {
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
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
