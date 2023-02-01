// import 'package:json_annotation/json_annotation.dart';
//
// import '../../domain/entitites/news_entities.dart';
//
// import 'dart:convert';
// part 'news_model.g.dart';
// List<NewsModel> modelArticleFromJson(String str) => List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));
// String modelArticleToJson(List<NewsModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
//
// @JsonSerializable(explicitToJson: true)
// class NewsModel {
//   @JsonKey(name: "status",defaultValue: "ok")
//   final String status;
//   @JsonKey(name: "totalResults",defaultValue: 2000)
//   final int total;
//   List<NewsArticleModel> articles;
//   NewsModel({
//     required this.status,
//     required this.total,
//     required this.articles,
//   });
//
//   NewsEntities toEntity() => NewsEntities(
//         status: status,
//         total: total,
//         articles: articles
//             .map(
//               (e) => e.toEntity(),
//             )
//             .toList(),
//       );
//
//   factory NewsModel.fromJson(Map<String, dynamic> json) =>
//       _$NewsModelFromJson(json);
//   Map<String, dynamic> toJson() => _$NewsModelToJson(this);
// }
//
// @JsonSerializable(explicitToJson: true)
// class NewsArticleModel {
//   final NewsArticleSourceModel source;
//   final int id;
//   final DateTime date;
//   NewsArticleModel({
//     required this.source,
//     required this.id,
//     required this.date,
//   });
//
//   NewsArticleEntities toEntity() => NewsArticleEntities(
//         source: source.toEntity(),
//         id: id,
//         date: date,
//       );
//
//   factory NewsArticleModel.fromJson(Map<String, dynamic> json) =>
//       _$NewsArticleModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$NewsArticleModelToJson(this);
// }
//
//
// @JsonSerializable(explicitToJson: true)
// class NewsArticleSourceModel {
//   @JsonKey(name: "title", defaultValue: "")
//   final String title;
//   @JsonKey(name: "ogDescription", defaultValue: "")
//   final String ogDescription;
//   @JsonKey(name: "ogUrl", defaultValue: "")
//   final String ogUrl;
//   @JsonKey(name: "author", defaultValue: "")
//   final String author;
//   // List<NewsArticleImageModel> ogImage;
//   // final NewsArticleSchemaModel schema;
//
//
//   NewsArticleSourceModel(
//       {required this.title,
//       required this.ogDescription,
//       required this.ogUrl,
//       required this.author,
//         // required this.ogImage,
//         // required this.schema,
//       });
//
//   NewsArticleSourceEntities toEntity() =>
//       NewsArticleSourceEntities(
//       title: title,
//           ogDescription: ogDescription,
//           ogUrl: ogUrl,
//           author: author,
//           // ogImage: ogImage.map(
//           //       (e) => e.toEntity(),
//           // )
//           //     .toList(),
//           // schema: schema.toEntity()
//       );
//
//
//   factory NewsArticleSourceModel.fromJson(Map<String, dynamic> json) =>
//       _$NewsArticleSourceModelFromJson(json);
//
//   Map<String, dynamic> toJson() => _$NewsArticleSourceModelToJson(this);
// }
//
// //==============================
// // @JsonSerializable(explicitToJson: true)
// // class NewsArticleImageModel {
// //   @JsonKey(name: "url", defaultValue: "")
// //   final String url;
// //
// //
// //
// //   NewsArticleImageModel(
// //       {required this.url,
// //       });
// //
// //   NewsArticleImageEntities toEntity() =>
// //       NewsArticleImageEntities(
// //           url: url,);
// //
// //
// //   factory NewsArticleImageModel.fromJson(Map<String, dynamic> json) =>
// //       _$NewsArticleImageModelFromJson(json);
// //
// //   Map<String, dynamic> toJson() => _$NewsArticleImageModelToJson(this);
// // }
// //
// //
// // //=============================
// // @JsonSerializable(explicitToJson: true)
// // class NewsArticleSchemaModel {
// //   List<NewsArticleSchemaGraphModel> graph;
// //   NewsArticleSchemaModel({
// //     required this.graph,
// //   });
// //
// //   NewsArticleSchemaEntities toEntity() => NewsArticleSchemaEntities(
// //     graph: graph
// //         .map(
// //           (e) => e.toEntity(),
// //     )
// //         .toList(),
// //   );
// //
// //   factory NewsArticleSchemaModel.fromJson(Map<String, dynamic> json) =>
// //       _$NewsArticleSchemaModelFromJson(json);
// //   Map<String, dynamic> toJson() => _$NewsArticleSchemaModelToJson(this);
// // }
// //
// //
// // //==============================
// // @JsonSerializable(explicitToJson: true)
// // class NewsArticleSchemaGraphModel {
// //   List<String> articleSection;
// //
// //
// //
// //   NewsArticleSchemaGraphModel(
// //       {required this.articleSection,
// //       });
// //
// //   NewsArticleSchemaGraphEntities toEntity() =>
// //       NewsArticleSchemaGraphEntities(
// //         articleSection: articleSection.map(
// //               (e) => e,
// //         )
// //             .toList(),);
// //
// //
// //   factory NewsArticleSchemaGraphModel.fromJson(Map<String, dynamic> json) =>
// //       _$NewsArticleSchemaGraphModelFromJson(json);
// //
// //   Map<String, dynamic> toJson() => _$NewsArticleSchemaGraphModelToJson(this);
// // }