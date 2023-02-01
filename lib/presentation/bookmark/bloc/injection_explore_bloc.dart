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
