import 'package:dartz/dartz.dart';

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../abstraction/bookmark_repository.dart';
import '../../entitites/news_entities.dart';

class GetBookmarkCase implements UseCase<NewsEntities, NoParams> {
  final BookmarkRepository repository;

  GetBookmarkCase(this.repository);

  @override
  Future<Either<Failure, NewsEntities>> call(NoParams params) async {
    return await repository.readBookmark();
  }
}

// class GetBookmarkCase extends UseCase<List<ArticleEntity>, NoParams> {
//   final BookmarkRepository articleRepository;
//
//   GetBookmarkCase(this.articleRepository);
//
//   @override
//   Future<Either<Failure, List<ArticleEntity>>> call(NoParams params) async {
//     return await articleRepository.getFavoriteArticles();
//   }
// }
