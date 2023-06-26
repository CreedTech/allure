part of 'bookmark_news_bloc.dart';

abstract class BookmarkNewsEvent extends Equatable {
  const BookmarkNewsEvent();

  @override
  List<Object> get props => [];
}

class BookmarkNewsGetEvent extends BookmarkNewsEvent {
  const BookmarkNewsGetEvent();

  @override
  List<Object> get props => [];
}

class BookmarkNewsAddEvent extends BookmarkNewsEvent {
  final List<ArticleEntity> add;

  const BookmarkNewsAddEvent({
    required this.add,
  });

  @override
  List<Object> get props => [add];
}

class BookmarkNewsRemoveEvent extends BookmarkNewsEvent {
  final ArticleEntity remove;

  const BookmarkNewsRemoveEvent({
    required this.remove,
  });

  @override
  List<Object> get props => [remove];
}
