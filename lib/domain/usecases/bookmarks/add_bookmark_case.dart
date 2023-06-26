import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../errors/error.dart';
import '../../../usecases/case.dart';
import '../../abstraction/bookmark_repository.dart';
import '../../entitites/news_entities.dart';

class AddBookmarkCase implements UseCase<void, AddBookmarkParams> {
  final BookmarkRepository repository;

  AddBookmarkCase(this.repository);

  @override
  Future<Either<Failure, void>> call(AddBookmarkParams params) async {
    return await repository.addBookmark(params.news);
  }
}

class AddBookmarkParams extends Equatable {
  final NewsEntities news;

  const AddBookmarkParams(this.news);

  @override
  List<Object> get props => [news];
}

// import 'package:allure/errors/error.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../../usecases/case.dart';
// import '../../abstraction/bookmark_repository.dart';
// import '../../entities/article_entity.dart';
//
//
// class AddBookmarkCase extends UseCase<void, ArticleEntity> {
//   final BookmarkRepository repository;
//
//   AddBookmarkCase(this.repository);
//
//   @override
//   Future<Either<Failure, void>> call(ArticleEntity params) async {
//     return await repository.saveArticle(params);
//   }
// }
