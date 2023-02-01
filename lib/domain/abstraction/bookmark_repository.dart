import 'package:dartz/dartz.dart';

import '../../errors/error.dart';
import '../entities/article_entity.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, bool>> addBookmark(List<ArticleEntity> news);
  Future<Either<Failure, bool>> removeBookmark(List<ArticleEntity> news);
  Future<Either<Failure, List<ArticleEntity>>> readBookmark();
}
