import 'package:dartz/dartz.dart';

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../abstraction/bookmark_repository.dart';
import '../../entities/article_entity.dart';

class RemoveBookmarkCase implements UseCase<bool, RemoveBookmarkParams> {
  final BookmarkRepository repository;

  RemoveBookmarkCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(RemoveBookmarkParams params) async {
    return await repository.removeBookmark(params.news);
  }
}

class RemoveBookmarkParams {
  final List<ArticleEntity> news;

  RemoveBookmarkParams(this.news);
}
