import 'package:dartz/dartz.dart';

import '../../core/core.dart';
import '../entitites/news_entities.dart';

abstract class BookmarkRepository {
  Future<Either<Failure, bool>> addBookmark(NewsEntities news);
  Future<Either<Failure, bool>> removeBookmark(NewsEntities news);
  Future<Either<Failure, NewsEntities>> readBookmark();
}
