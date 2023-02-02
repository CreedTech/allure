part of 'home_news_bloc.dart';

class HomeNewsState extends Equatable {
  final HomeBlocStatus statusTrending;
  final HomeBlocStatus statusHot;
  final HomeBlocStatus statusRecommendation;
  final NewsEntities? trending;
  final NewsEntities? recommendation;
  final NewsEntities? hot;
  final NewsEntities? category;

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
    NewsEntities? trending,
    NewsEntities? recommendation,
    NewsEntities? hot,
    NewsEntities? category,
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
