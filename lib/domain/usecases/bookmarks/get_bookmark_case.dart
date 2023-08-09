import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../abstraction/bookmark_repository.dart';
<<<<<<< HEAD
import '../../entitites/news_entities.dart';
=======
import '../../domain.dart';
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24

class GetBookmarkCase implements UseCase<NewsEntities, NoParams> {
  final BookmarkRepository repository;

  GetBookmarkCase(this.repository);

  @override
  Future<Either<Failure, NewsEntities>> call(NoParams params) async {
    return await repository.readBookmark();
  }
}

<<<<<<< HEAD
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
=======
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
