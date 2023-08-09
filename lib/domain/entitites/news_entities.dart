// import 'package:allure/domain/entities/article_entity.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/article_model.dart';


class NewsEntities extends Equatable {
  final String status;
  final int total;
  final List<NewsArticleEntities> articles;
  const NewsEntities({
    required this.status,
    required this.total,
    required this.articles,
  });

  NewsModel toModel() => NewsModel(
        status: status,
        total: total,
        articles: articles.map((e) => e.toModel()).toList(),
      );

  @override
  List<Object> get props => [status, total, articles];
}

class NewsArticleEntities extends Equatable {
  final NewsArticleSourceEntities yoastHeadJson;
  final int id;
  final DateTime date;
  final NewsArticleGuidEntities title;
  final NewsArticleContentEntities content;
  final String link;

  const NewsArticleEntities({
    required this.yoastHeadJson,
    required this.id,
    required this.date,
    required this.title,
    required this.content,
    required this.link
  });

  NewsArticleModel toModel() => NewsArticleModel(
    yoastHeadJson: yoastHeadJson.toModel(),
        id: id,
        date: date,
    title: title.toModel(),
    content: content.toModel(),
    link: link
      );

  @override
  List<Object> get props {
    return [yoastHeadJson, id, date, title, content, link];
  }
}

class NewsArticleSourceEntities extends Equatable {
  final String ogTitle;
  final String ogDescription;
  final String ogUrl;
  final String author;
  final List<NewsArticleImageEntities> ogImage;
  final NewsArticleSchemaEntities schema;
  // final Schema? schema;
  const NewsArticleSourceEntities(
      {required this.ogTitle,
      required this.ogDescription,
      required this.ogUrl,
      required this.author,
      required this.ogImage,
      required this.schema
      });

  NewsArticleSourceModel toModel() => NewsArticleSourceModel(
      ogTitle: ogTitle,
      ogDescription: ogDescription,
      ogUrl: ogUrl,
      author: author,
      ogImage: ogImage.map((e) => e.toModel()).toList(),
      schema: schema.toModel()
  );
  @override
  List<Object> get props =>
      [ogTitle, ogDescription, ogUrl, author,
        ogImage, schema
      ];
}

class NewsArticleGuidEntities extends Equatable {
  final String rendered;
  // final Schema? schema;
  const NewsArticleGuidEntities(
      {
        required this.rendered,
      });

  NewsArticleGuidModel toModel() => NewsArticleGuidModel(
      rendered: rendered,
  );
  @override
  List<Object> get props =>
      [rendered
      ];
}

class NewsArticleContentEntities extends Equatable {
  final String rendered;
  // final Schema? schema;
  const NewsArticleContentEntities(
      {
        required this.rendered,
      });

  NewsArticleContentModel toModel() => NewsArticleContentModel(
    rendered: rendered,
  );
  @override
  List<Object> get props =>
      [rendered
      ];
}


class NewsArticleImageEntities extends Equatable {
  final String url;
  const NewsArticleImageEntities({required this.url});

  NewsArticleImageModel toModel() => NewsArticleImageModel(
        url: url,
      );
  @override
  List<Object> get props => [url];
}

class NewsArticleSchemaEntities extends Equatable {
  final List<NewsArticleSchemaGraphEntities> graph;
  const NewsArticleSchemaEntities({
    required this.graph,
  });

  NewsArticleSchemaModel toModel() => NewsArticleSchemaModel(
        graph: graph.map((e) => e.toModel()).toList(),
      );
  @override
  List<Object> get props => [graph];
}

class NewsArticleSchemaGraphEntities extends Equatable {
  final List<String> articleSection;
  const NewsArticleSchemaGraphEntities({
    required this.articleSection,
  });

  NewsArticleSchemaGraphModel toModel() => NewsArticleSchemaGraphModel(
        articleSection: articleSection.map((e) => e).toList(),
      );
  @override
  List<Object> get props => [articleSection];
}
