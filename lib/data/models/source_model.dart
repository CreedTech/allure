
import '../../domain/entities/SourceEntity.dart';

class SourceModel extends SourceEntity {
  final String id;
  final String name;
  final String? description;
  final String? url;
  final String? category;
  final String? country;
  final String? language;

  SourceModel({
    required this.id,
    required this.name,
    this.description,
    this.url,
    this.category,
    this.country,
    this.language,
  }) : super(
    id: id,
    name: name,
  );

  factory SourceModel.fromJson(Map<String, dynamic> json) {
    return SourceModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      id: json['id'] ?? '',
      url: json['url'] ?? '',
      category: json['category'] ?? '',
      country: json['country'] ?? '',
      language: json['language'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['country'] = country;
    data['url'] = url;
    data['category'] = category;
    data['language'] = language;
    return data;
  }
}
