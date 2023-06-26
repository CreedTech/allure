// import 'package:allure/domain/abstraction/abstraction.dart';
// import 'package:allure/errors/error.dart';
// import 'package:dartz/dartz.dart';
//
// import '../../../usecases/case.dart';
// import '../../entities/article_detail_entity.dart';
// import '../../entities/article_params.dart';
//
//
// class GetArticleDetail extends UseCase<ArticleDetailEntity, ArticleParams> {
//   final NewsRepository repository;
//
//   GetArticleDetail(this.repository);
//
//   @override
//   Future<Either<Failure, ArticleDetailEntity>> call(
//       ArticleParams params) async {
//     return await repository.getArticleDetail(params.id);
//   }
// }
