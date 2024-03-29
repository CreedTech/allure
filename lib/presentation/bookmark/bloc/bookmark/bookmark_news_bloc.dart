import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/core.dart';
import '../../../../domain/domain.dart';
import '../../../../domain/usecases/bookmarks/remove_bookmark_case.dart';
import '../enum_explore_bloc.dart';

part 'bookmark_news_event.dart';
part 'bookmark_news_state.dart';

class BookmarkNewsBloc extends Bloc<BookmarkNewsEvent, BookmarkNewsState> {
  final AddBookmarkCase addBookmarkCase;
  final GetBookmarkCase getBookmarkCase;
  final RemoveBookmarkCase removeBookmarkCase;

  BookmarkNewsBloc({
    required this.addBookmarkCase,
    required this.getBookmarkCase,
    required this.removeBookmarkCase,
  }) : super(const BookmarkNewsState()) {
    on<BookmarkNewsEvent>((event, emit) {});
    on<BookmarkNewsGetEvent>(_onBookmarkNewsGetEvent);
    on<BookmarkNewsAddEvent>(_onBookmarkNewsAddEvent);
    on<BookmarkNewsRemoveEvent>(_onBookmarkNewsRemoveEvent);
  }

  void _onBookmarkNewsGetEvent(
      BookmarkNewsGetEvent event, Emitter<BookmarkNewsState> emit) async {
    emit(state.copyWith(status: BookmarkBlocStatus.loading));
    await getBookmarkCase(NoParams()).then(
<<<<<<< HEAD
      (value) => value.fold(
          (l) => emit(
                state.copyWith(
                  status: BookmarkBlocStatus.failure,
                  message: Guide.failureToMessage(l),
                ),
              ), (r) {
        emit(
=======
          (value) => value.fold(
            (l) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.failure,
            message: Guide.failureToMessage(l),
          ),
        ),
            (r) => emit(
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
          state.copyWith(
            status: BookmarkBlocStatus.loaded,
            response: r,
          ),
        );
        if (kDebugMode) {
          print("Printing");
        }
        if (kDebugMode) {
          print(r);
        }
        if (kDebugMode) {
          print("Printed");
        }
      }),
    );
    // print("response");
    // print(state.response);
    return;
  }

  void _onBookmarkNewsAddEvent(
      BookmarkNewsAddEvent event, Emitter<BookmarkNewsState> emit) async {
    emit(state.copyWith(status: BookmarkBlocStatus.loading));
    final data = NewsEntities(status: "ok", total: 1, articles: event.add);
    // List.of(state.response : event.add);
    // NewsEntities(status: "ok", total: 1, articles: event.add);
    await addBookmarkCase(AddBookmarkParams(data)).then(
          (value) => value.fold(
            (l) => emit(
          state.copyWith(
            status: BookmarkBlocStatus.failure,
            message: Guide.failureToMessage(l),
          ),
        ),
            (r) => emit(
          state.copyWith(
            // response: state.response..add(event.add),
            status: BookmarkBlocStatus.loaded,
          ),
          // state.copyWith(
          //   status: BookmarkBlocStatus.loaded,
          // ),
        ),
      ),
    );
    return;
  }

  void _onBookmarkNewsRemoveEvent(
      BookmarkNewsRemoveEvent event, Emitter<BookmarkNewsState> emit) async {
<<<<<<< HEAD
    final data = [];
    await removeBookmarkCase(RemoveBookmarkParams(data as List<ArticleEntity>))
        .then(
      (value) => value.fold(
        (l) => emit(
=======
    final data = NewsEntities(status: "ok", total: 1, articles: event.remove);
    await removeBookmarkCase(RemoveBookmarkParams(data)).then(
          (value) => value.fold(
            (l) => emit(
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
          state.copyWith(
            status: BookmarkBlocStatus.failure,
            message: Guide.failureToMessage(l),
          ),
        ),
            (r) => emit(
          state.copyWith(
            // response: List.of(state.response)..add(event.remove),
            status: BookmarkBlocStatus.loaded,
          ),
          // state.copyWith(
          //   status: BookmarkBlocStatus.loaded,
          // ),
        ),
      ),
    );
    return;
  }
}
