import 'package:dartz/dartz.dart';

<<<<<<< HEAD
import '../../errors/error.dart';
import '../entities/article_entity.dart';
=======
import '../../core/core.dart';
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
import '../entitites/news_entities.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, bool>> addBookmark(NewsEntities news);
<<<<<<< HEAD

  Future<Either<Failure, bool>> removeBookmark(List<ArticleEntity> news);

=======
  Future<Either<Failure, bool>> removeBookmark(NewsEntities news);
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
  Future<Either<Failure, NewsEntities>> readBookmark();
}

// import 'package:dartz/dartz.dart';
//
// import '../../errors/error.dart';
// import '../entities/article_entity.dart';
//
// abstract class BookmarkRepository {
//   Future<Either<Failure, void>> saveArticle(ArticleEntity articleEntity);
//   Future<Either<Failure, List<ArticleEntity>>> getFavoriteArticles();
//   Future<Either<Failure, void>> deleteFavoriteArticle(int articleId);
//   Future<Either<Failure, bool>> checkIfArticleFavorite(int articleId);
// }
