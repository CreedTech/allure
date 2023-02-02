import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../domain.dart';

class GetHotCase implements UseCase<NewsEntities, NoParams> {
  final NewsRepository repository;

  GetHotCase(this.repository);

  @override
  Future<Either<Failure, NewsEntities>> call(NoParams params) async {
    return await repository.getHotNews();
  }
}