import 'package:allure/data/models/yoast_head_json.dart';
import 'package:html/parser.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import '../../domain/entities/article_entity.dart';

List<ArticleModel> modelUserFromJson(String str) => List<ArticleModel>.from(
    json.decode(str).map((x) => ArticleModel.fromJson(x)));

String modelUserToJson(List<ArticleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

String _parseHtmlString(String htmlString) {
  var document = parse(htmlString);

  String parsedString = parse(document.body!.text).documentElement!.text;

  return parsedString;
}

@JsonSerializable(explicitToJson: true)
class ArticleModel {
  final ArticleModel yoastHeadJson;
    final int id;
  final DateTime date;

  ArticleModel(this.yoastHeadJson, {
    // required this.yoastHeadJson,
    required this.id,
    required this.date, required String category,
    // this.categories,
    // this.author,
    // this.description,
    // required this.title,
    // this.url,
    // this.img,
    // this.date,
    // this.content,
  }) : super(
            id: id,
            // yoastHeadJson: yoastHeadJson,
            date: date,
            // categories: categories,
  );

  factory ArticleModel.fromJson(Map<dynamic, dynamic> json) => ArticleModel(
    id: json["id"],
    date: DateTime.parse(json["date"]),
    // yoastHeadJson: YoastHeadJson.fromJson(json["yoast_head_json"]),
      );

  Map<dynamic, dynamic> toJson() => {
    "id":id,
    "date":date.toIso8601String(),
    "yoast_head_json": yoastHeadJson.toJson(),
  };

  toEntity() {}
}


  // Map<String, dynamic> toJson() => _$NewsArticleSchemaGraphModelToJson(this);
// }