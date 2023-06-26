import 'package:get_it/get_it.dart';

import 'bookmark/bookmark_news_bloc.dart';

class BookmarkBlocInjection {
  static void init({
    required GetIt sl,
  }) {
    sl.registerFactory(
      () => BookmarkNewsBloc(
        addBookmarkCase: sl(),
        getBookmarkCase: sl(),
        removeBookmarkCase: sl(),
      ),
    );
  }
}

// import 'package:allure/presentation/bookmark/bloc/bookmark/bookmark_cubit.dart';
// import 'package:get_it/get_it.dart';
//
// import 'bookmark/bookmark_news_bloc.dart';
//
// class BookmarkBlocInjection {
//   static void init({
//     required GetIt sl,
//   }) {
//     sl.registerFactory(
//           () => FavoriteCubit(
//         saveArticle: sl(),
//         checkIfFavoriteArticle: sl(),
//         deleteFavoriteArticle: sl(),
//         getFavoriteArticles: sl(),
//       ),
//     );
//   }
// }
