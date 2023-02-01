import 'package:dartz/dartz.dart';

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../abstraction/news_repository.dart';
import '../../entities/article_entity.dart';

class GetHotCase implements UseCase<List<ArticleEntity>, NoParams> {
  final NewsRepository repository;

  GetHotCase(this.repository);

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(NoParams params) async {
    return await repository.getHotNews();
  }
}
