// import 'package:allure/errors/error.dart';
// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
//
// import '../../../../domain/entities/article_detail_entity.dart';
// import '../../../../domain/entities/article_params.dart';
// import '../../../bookmark/bloc/bookmark/bookmark_cubit.dart';
// import '../../../loading/bloc/loading_cubit.dart';
//
// part 'article_detail_state.dart';
//
// class ArticleDetailCubit extends Cubit<ArticleDetailState> {
//   final GetArticleDetail getArticleDetail;
//   final FavoriteCubit favoriteCubit;
//   final LoadingCubit loadingCubit;
//
//   ArticleDetailCubit({
//     required this.getArticleDetail,
//     required this.favoriteCubit,
//     required this.loadingCubit,
//   }) : super(ArticleDetailInitial());
//
//   void loadArticleDetail(int articleId) async {
//     loadingCubit.show();
//     final Either<Failure, ArticleDetailEntity> eitherResponse =
//         await getArticleDetail(
//       ArticleParams(articleId),
//     );
//
//     emit(eitherResponse.fold(
//       (l) => ArticleDetailError(),
//       (r) => ArticleDetailLoaded(r),
//     ));
//
//     favoriteCubit.checkIfArticleFavorite(articleId);
//   }
// }
