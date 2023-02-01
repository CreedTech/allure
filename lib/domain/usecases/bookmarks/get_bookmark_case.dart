import 'package:dartz/dartz.dart';

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../abstraction/bookmark_repository.dart';
import '../../entities/article_entity.dart';

class GetBookmarkCase implements UseCase<List<ArticleEntity>, NoParams> {
  final BookmarkRepository repository;

  GetBookmarkCase(this.repository);

  @override
  Future<Either<Failure, List<ArticleEntity>>> call(NoParams params) async {
    return await repository.readBookmark();
  }
}
