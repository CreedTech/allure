// import 'package:allure/data/models/yoast_head_json.dart';
// import 'dart:convert';
// import '../../domain/entities/article_entity.dart';
//
//
//
//
//
// List<ArticleModel> modelUserFromJson(String str) => List<ArticleModel>.from(json.decode(str).map((x) => ArticleModel.fromJson(x)));
// String modelUserToJson(List<ArticleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ArticleModel extends ArticleEntity {
//   final int id;
//   final DateTime date;
//   final YoastHeadJson yoastHeadJson;
//
//   ArticleModel({
//     required this.id,
//     required this.date,
//     required this.yoastHeadJson,
//     // this.categories,
//     // this.author,
//     // this.ogDescription,
//     // required this.title,
//     // this.ogUrl,
//     // this.img,
//     // this.date,
//     // this.content,
//   }) : super(
//             id: id,
//             yoastHeadJson: yoastHeadJson,
//             date: date,
//             // categories: categories,
//   );
//
//   factory ArticleModel.fromJson(Map<dynamic, dynamic> json) => ArticleModel(
//     id: json["id"],
//     date: DateTime.parse(json["date"]),
//     yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
//       );
//
//   Map<dynamic, dynamic> toJson() => {
//     "id":id,
//     "date":date.toIso8601String(),
//     "yoast_head_json": yoastHeadJson.toJson(),
//   };
// }
//

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import '../../domain/entitites/news_entities.dart';

part 'article_model.g.dart';

List<NewsArticleModel> modelUserFromJson(String str) => List<NewsArticleModel>.from(json.decode(str).map((x) => NewsArticleModel.fromJson(x)));
String modelUserToJson(List<NewsArticleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class NewsModel {
  final String status;
  @JsonKey(name: "totalResults")
  final int total;
  List<NewsArticleModel> articles;
  NewsModel({
    required this.status,
    required this.total,
    required this.articles,
  });

  NewsEntities toEntity() => NewsEntities(
    status: status,
    total: total,
    articles: articles
        .map(
          (e) => e.toEntity(),
    )
        .toList(),
  );

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsArticleModel {
  final NewsArticleSourceModel yoastHeadJson;
    final int id;
  final DateTime date;
  final NewsArticleGuidModel title;
  final NewsArticleContentModel content;
  final String link;

  NewsArticleModel({
    required this.yoastHeadJson,
    required this.id,
    required this.date,
    required this.title,
    required this.content,
    required this.link,
  });

  NewsArticleEntities toEntity() => NewsArticleEntities(
    yoastHeadJson: yoastHeadJson.toEntity(),
            id: id,
        date: date,
    title: title.toEntity(),
    content: content.toEntity(),
    link: link,
  );

  factory NewsArticleModel.fromJson(json) =>
      _$NewsArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsArticleSourceModel {
  @JsonKey(defaultValue: "")
  final String author;
  @JsonKey(defaultValue: "")
  final String ogTitle;
  @JsonKey(defaultValue: "")
  final String ogDescription;
  @JsonKey(defaultValue: "")
  final String ogUrl;
  List<NewsArticleImageModel> ogImage;
  final NewsArticleSchemaModel schema;

  NewsArticleSourceModel({
required this.author,
required this.ogTitle,
required this.ogDescription,
required this.ogUrl,
required this.ogImage,
    required this.schema,
  });

  NewsArticleSourceEntities toEntity() =>
      NewsArticleSourceEntities(
        author: author,
        ogTitle: ogTitle,
        ogDescription: ogDescription,
        ogUrl: ogUrl,
        ogImage: ogImage
            .map(
              (e) => e.toEntity(),
        )
            .toList(),
        schema: schema.toEntity(),
      );

  factory NewsArticleSourceModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSourceModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleSourceModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsArticleGuidModel {
  final String rendered;

  NewsArticleGuidModel({
    required this.rendered,
  });

  NewsArticleGuidEntities toEntity() =>
      NewsArticleGuidEntities(
        rendered: rendered,
      );

  factory NewsArticleGuidModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleGuidModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleGuidModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewsArticleContentModel {
  final String rendered;

  NewsArticleContentModel({
    required this.rendered,
  });

  NewsArticleContentEntities toEntity() =>
      NewsArticleContentEntities(
        rendered: rendered,
      );

  factory NewsArticleContentModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleContentModelToJson(this);
}


// ==============================
@JsonSerializable(explicitToJson: true)
class NewsArticleImageModel {
  @JsonKey(name: "url", defaultValue: "")
  final String url;



  NewsArticleImageModel(
      {required this.url,
      });

  NewsArticleImageEntities toEntity() =>
      NewsArticleImageEntities(
          url: url,);


  factory NewsArticleImageModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleImageModelToJson(this);
}


//=============================
@JsonSerializable(explicitToJson: true)
class NewsArticleSchemaModel {
  List<NewsArticleSchemaGraphModel> graph;
  NewsArticleSchemaModel({
    required this.graph,
  });

  NewsArticleSchemaEntities toEntity() => NewsArticleSchemaEntities(
    graph: graph
        .map(
          (e) => e.toEntity(),
    )
        .toList(),
  );

  factory NewsArticleSchemaModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSchemaModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsArticleSchemaModelToJson(this);
}


//==============================
@JsonSerializable(explicitToJson: true)
class NewsArticleSchemaGraphModel {
  List<String> articleSection;


  NewsArticleSchemaGraphModel({required this.articleSection,
  });

  NewsArticleSchemaGraphEntities toEntity() =>
      NewsArticleSchemaGraphEntities(
        articleSection: articleSection.map(
              (e) => e,
        )
            .toList(),);


  factory NewsArticleSchemaGraphModel.fromJson(Map<String, dynamic> json) =>
      _$NewsArticleSchemaGraphModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsArticleSchemaGraphModelToJson(this);
}