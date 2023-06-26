// import 'package:allure/errors/error.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../../usecases/case.dart';
// import '../../abstraction/bookmark_repository.dart';
// import '../../entities/article_params.dart';
//
//
// class CheckIfFavoriteArticle extends UseCase<bool, ArticleParams> {
//   final BookmarkRepository articleRepository;
//
//   CheckIfFavoriteArticle(this.articleRepository);
//
//   @override
//   Future<Either<Failure, bool>> call(ArticleParams params) async {
//     return await articleRepository.checkIfArticleFavorite(params.id);
//   }
// }
