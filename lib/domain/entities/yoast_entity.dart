import 'package:equatable/equatable.dart';

import '../../data/models/yoast_head_json.dart';

class YoastEntity extends Equatable {
  final String ogTitle;
  final String? ogUrl;
  final String ogDescription;
  final DateTime? articlePublishedTime;
  // final List<OgImage>? ogImage;
  final String author;

  const YoastEntity({
    required this.ogTitle,
    required this.ogDescription,
    this.ogUrl,
    this.articlePublishedTime,
    // this.ogImage,
    required this.author,
    // this.schema,
  });

  YoastHeadJson toModel() => YoastHeadJson(
    ogTitle: ogTitle,
    ogDescription: ogDescription,
    ogUrl: ogUrl,
    articlePublishedTime: articlePublishedTime,
    author: author
  );

  @override
  List<Object> get props => [ogTitle, ogDescription,author];

  @override
  bool get stringify => true;
}