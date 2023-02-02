// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      status: json['status'] as String,
      total: json['totalResults'] as int,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => NewsArticleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.total,
      'articles': instance.articles,
    };

NewsArticleModel _$NewsArticleModelFromJson(Map<String, dynamic> json) =>
    NewsArticleModel(
      yoastHeadJson: NewsArticleSourceModel.fromJson(
          json['yoastHeadJson'] as Map<String, dynamic>),
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      title:
          NewsArticleGuidModel.fromJson(json['title'] as Map<String, dynamic>),
      content: NewsArticleContentModel.fromJson(
          json['content'] as Map<String, dynamic>),
      link: json['link'] as String,
    );

Map<String, dynamic> _$NewsArticleModelToJson(NewsArticleModel instance) =>
    <String, dynamic>{
      'yoastHeadJson': instance.yoastHeadJson.toJson(),
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'title': instance.title.toJson(),
      'content': instance.content.toJson(),
      'link': instance.link,
    };

NewsArticleSourceModel _$NewsArticleSourceModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleSourceModel(
      author: json['author'] as String? ?? '',
      ogTitle: json['ogTitle'] as String? ?? '',
      ogDescription: json['ogDescription'] as String? ?? '',
      ogUrl: json['ogUrl'] as String? ?? '',
      ogImage: (json['ogImage'] as List<dynamic>)
          .map((e) => NewsArticleImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      schema: NewsArticleSchemaModel.fromJson(
          json['schema'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsArticleSourceModelToJson(
        NewsArticleSourceModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'ogTitle': instance.ogTitle,
      'ogDescription': instance.ogDescription,
      'ogUrl': instance.ogUrl,
      'ogImage': instance.ogImage.map((e) => e.toJson()).toList(),
      'schema': instance.schema.toJson(),
    };

NewsArticleGuidModel _$NewsArticleGuidModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleGuidModel(
      rendered: json['rendered'] as String,
    );

Map<String, dynamic> _$NewsArticleGuidModelToJson(
        NewsArticleGuidModel instance) =>
    <String, dynamic>{
      'rendered': instance.rendered,
    };

NewsArticleContentModel _$NewsArticleContentModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleContentModel(
      rendered: json['rendered'] as String,
    );

Map<String, dynamic> _$NewsArticleContentModelToJson(
        NewsArticleContentModel instance) =>
    <String, dynamic>{
      'rendered': instance.rendered,
    };

NewsArticleImageModel _$NewsArticleImageModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleImageModel(
      url: json['url'] as String? ?? '',
    );

Map<String, dynamic> _$NewsArticleImageModelToJson(
        NewsArticleImageModel instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

NewsArticleSchemaModel _$NewsArticleSchemaModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleSchemaModel(
      graph: (json['graph'] as List<dynamic>)
          .map((e) =>
              NewsArticleSchemaGraphModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsArticleSchemaModelToJson(
        NewsArticleSchemaModel instance) =>
    <String, dynamic>{
      'graph': instance.graph.map((e) => e.toJson()).toList(),
    };

NewsArticleSchemaGraphModel _$NewsArticleSchemaGraphModelFromJson(
        Map<String, dynamic> json) =>
    NewsArticleSchemaGraphModel(
      articleSection: (json['articleSection'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NewsArticleSchemaGraphModelToJson(
        NewsArticleSchemaGraphModel instance) =>
    <String, dynamic>{
      'articleSection': instance.articleSection,
    };
