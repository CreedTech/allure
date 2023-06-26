import 'package:hive/hive.dart';

import '../../domain/entities/article_entity.dart';
part 'article_table.g.dart';

@HiveType(typeId: 0)
class ArticleTable extends ArticleEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final String category;

  @HiveField(3)
  final String banner;

  @HiveField(4)
  final String author;

  @HiveField(5)
  final String title;

  @HiveField(6)
  final String description;

  @HiveField(7)
  final String link;

  ArticleTable({
    required this.id,
    required this.date,
    required this.category,
    required this.banner,
    required this.author,
    required this.title,
    required this.description,
    required this.link,
  }) : super(
          id: id,
          date: date,
          category: category,
          banner: banner,
          author: author,
          title: title,
          description: description,
          link: link,
        );

  factory ArticleTable.fromArticleEntity(ArticleEntity articleEntity) {
    return ArticleTable(
      id: articleEntity.id,
      date: articleEntity.date,
      category: articleEntity.category,
      banner: articleEntity.banner,
      author: articleEntity.author,
      title: articleEntity.title,
      description: articleEntity.description,
      link: articleEntity.link,
    );
  }
}
