// import 'package:allure/errors/error.dart';
// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../../domain/entities/article_entity.dart';
// import '../../../../domain/entities/article_params.dart';
// import '../../../../domain/usecases/bookmarks/add_bookmark_case.dart';
// import '../../../../domain/usecases/bookmarks/check_if_article_favorite.dart';
// import '../../../../domain/usecases/bookmarks/get_bookmark_case.dart';
// import '../../../../domain/usecases/bookmarks/remove_bookmark_case.dart';
// import '../../../../usecases/case.dart';
//
// part 'bookmark_state.dart';
//
// class FavoriteCubit extends Cubit<FavoriteState> {
//   final SaveArticle saveArticle;
//   final GetFavoriteArticles getFavoriteArticles;
//   final DeleteFavoriteArticle deleteFavoriteArticle;
//   final CheckIfFavoriteArticle checkIfFavoriteArticle;
//
//   FavoriteCubit({
//     required this.saveArticle,
//     required this.getFavoriteArticles,
//     required this.deleteFavoriteArticle,
//     required this.checkIfFavoriteArticle,
//   }) : super(FavoriteInitial());
//
//   void toggleFavoriteArticle(ArticleEntity articleEntity, bool isFavorite) async {
//     if (isFavorite) {
//       await deleteFavoriteArticle(ArticleParams(articleEntity.id));
//     } else {
//       await saveArticle(articleEntity);
//     }
//     final response = await checkIfFavoriteArticle(ArticleParams(articleEntity.id));
//     emit(response.fold(
//       (l) => FavoriteArticlesError(),
//       (r) => IsFavoriteArticle(r),
//     ));
//   }
//
//   void loadFavoriteArticle() async {
//     final Either<Failure, List<ArticleEntity>> response =
//         await getFavoriteArticles(NoParams());
//
//     emit(response.fold(
//       (l) => FavoriteArticlesError(),
//       (r) => FavoriteArticlesLoaded(r),
//     ));
//   }
//
//   void deleteArticle(int articleId) async {
//     await deleteFavoriteArticle(ArticleParams(articleId));
//     loadFavoriteArticle();
//   }
//
//   void checkIfArticleFavorite(int articleId) async {
//     final response = await checkIfFavoriteArticle(ArticleParams(articleId));
//     emit(response.fold(
//       (l) => FavoriteArticlesError(),
//       (r) => IsFavoriteArticle(r),
//     ));
//   }
// }
