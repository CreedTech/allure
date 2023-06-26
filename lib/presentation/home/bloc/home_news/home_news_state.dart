part of 'home_news_bloc.dart';

class HomeNewsState extends Equatable {
  final HomeBlocStatus statusTrending;
  final HomeBlocStatus statusHot;
  final HomeBlocStatus statusRecommendation;
  final List<ArticleEntity>? trending;
  final List<ArticleEntity>? recommendation;
  final List<ArticleEntity>? hot;
  final List<CategoryEntity>? category;

  final String message;

  const HomeNewsState({
    this.statusTrending = HomeBlocStatus.initial,
    this.statusHot = HomeBlocStatus.initial,
    this.statusRecommendation = HomeBlocStatus.initial,
    this.message = "",
    this.trending,
    this.recommendation,
    this.category,
    this.hot,
  });

  HomeNewsState copyWith({
    HomeBlocStatus? statusTrending,
    HomeBlocStatus? statusHot,
    HomeBlocStatus? statusRecommendation,
    List<ArticleEntity>? trending,
    List<ArticleEntity>? recommendation,
    List<ArticleEntity>? hot,
    List<CategoryEntity>? category,
    String? message,
  }) {
    return HomeNewsState(
      statusHot: statusHot ?? this.statusHot,
      statusTrending: statusTrending ?? this.statusTrending,
      statusRecommendation: statusRecommendation ?? this.statusRecommendation,
      trending: trending ?? this.trending,
      hot: hot ?? this.hot,
      category: category ?? this.category,
      recommendation: recommendation ?? this.recommendation,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [
        statusTrending,
        statusHot,
        statusRecommendation,
        trending,
        message,
        recommendation,
        hot,
        category
      ];
}
