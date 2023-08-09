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
<<<<<<< HEAD
  final List<ArticleEntity> add;

=======
  final List<NewsArticleEntities> add;
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
  const BookmarkNewsAddEvent({
    required this.add,
  });

  @override
  List<Object> get props => [add];
}

class BookmarkNewsRemoveEvent extends BookmarkNewsEvent {
<<<<<<< HEAD
  final ArticleEntity remove;

=======
  final List<NewsArticleEntities> remove;
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
  const BookmarkNewsRemoveEvent({
    required this.remove,
  });

  @override
  List<Object> get props => [remove];
}
