<<<<<<< HEAD
import 'package:allure/components/component_style.dart';
=======

>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../core/core.dart';
import '../../home/widget/trending_skeleton_widget.dart';
import '../bloc/enum_explore_bloc.dart';
import '../bloc/explore/explore_news_bloc.dart';

class SearchNewsView extends StatefulWidget {
  const SearchNewsView({super.key});

  @override
  State<SearchNewsView> createState() => _SearchNewsViewState();
}

class _SearchNewsViewState extends State<SearchNewsView> {
  late ScrollController scrollController;
  late TextEditingController textEditingController;

  @override
  void initState() {
    scrollController = ScrollController();
    textEditingController = TextEditingController();
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        context.read<ExploreNewsBloc>().add(const ExploreSearchNewsMore());
        return;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: colorPrimary,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: colorWhite,
          ),
          onPressed: () => Guide.back(),
        ),
        title: TextField(
          style: const TextStyle(
            color: colorsBlack,
          ),
          controller: textEditingController,
          onSubmitted: (keyword) {
            context.read<ExploreNewsBloc>().add(
                  ExploreSearchNews(
                    query: textEditingController.text,
                    page: 1,
                  ),
                );
            return;
          },
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            fillColor: colorWhite,
            hintText: "Technology, Politic, Food, Sports...",
            hintStyle: const TextStyle(
              color: darkThemeText,
            ),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              borderSide: const BorderSide(
                color: colorPrimary,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10.r),
              ),
              borderSide: const BorderSide(
                color: colorPrimary,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.read<ExploreNewsBloc>().add(
                  ExploreSearchNews(
                    query: textEditingController.text,
                    page: 1,
                  ),
                ),
            icon: SvgPicture.asset(
              "assets/icons/search_solid.svg",
              height: 24.h,
              width: 24.w,
              color: colorWhite,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: LiquidPullToRefresh(
          height: 200,
          animSpeedFactor: 2,
          showChildOpacityTransition: false,
          onRefresh: () async {},
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: Guide.isDark(context)
                    ? [
                        colorsBlack,
                        colorsBlackGray,
                      ]
                    : [
                        colorWhite,
                        colorGray,
                      ],
                // stops: [],
              ),
            ),
            child: BlocBuilder<ExploreNewsBloc, ExploreNewsState>(
              builder: (_, state) {
                if (state.status == ExploreBlocStatus.loading) {
                  List loading = [1, 2, 3, 4, 5, 6];
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: loading
                          .asMap()
                          .map(
                            (index, value) => MapEntry(
                              index,
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 4.h,
                                  top: index == 0 ? 20.h : 4.h,
                                ),
                                child: Shimmer.fromColors(
                                  baseColor: Guide.isDark(context)
                                      ? Colors.white24
                                      : Colors.black,
                                  highlightColor: darkThemeText,
                                  child: const TrendingSkeletonWidget(),
                                ),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                    ),
                  );
                }
                if (state.status == ExploreBlocStatus.loaded) {
                  final data = state.article;
                  return ListView.builder(
                    controller: scrollController,
                    itemCount:
                        state.hasReachedMax ? data.length : data.length + 1,
                    itemBuilder: (ctx, index) {
                      return index >= data.length
                          ? data.length >= 10
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: 33.h,
                                        child: const CircularProgressIndicator(
                                          color: colorPrimary,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    )
                                  ],
                                )
                              : Container()
                          : GestureDetector(
                              onTap: () => Guide.to(
                                name: detail,
                                arguments: data[index],
                              ),
                              child: Container(
                                height: 100.h,
                                margin: EdgeInsets.only(
                                  left: 15.w,
                                  right: 15.w,
                                  bottom: 4.h,
                                  top: index == 0 ? 20.h : 4.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Guide.isDark(context)
                                      ? colorsBlack
                                      : colorWhite,
                                  border: Border.all(
                                    color: Guide.isDark(context)
                                        ? Colors.grey.withOpacity(0.2)
                                        : borderGray,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: SizedBox(
                                        width: 115.w,
                                        height: 100.h,
                                        child: CachedNetworkImage(
<<<<<<< HEAD
                                          imageUrl: data[index].banner,
=======
                                          imageUrl: data[index].yoastHeadJson.ogImage[0].url,
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
                                          // imageUrl: data[index].source.ogImage[0].url,
                                          imageBuilder: (c, image) => Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 8.h,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 220.w,
                                            child: Text(
<<<<<<< HEAD
                                              data[index].title,
=======
                                              data[index].title.rendered,
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ).boldSized(14).colors(
                                                Guide.isDark(context)
                                                    ? darkThemeText
                                                    : colorsBlack),
                                          ),
                                          SizedBox(
                                            width: 220.w,
                                            child: Text(
<<<<<<< HEAD
                                              data[index].description,
=======
                                              data[index].content.rendered,
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
                                              maxLines: 2,
                                              textAlign: TextAlign.justify,
                                              overflow: TextOverflow.ellipsis,
                                            ).normalSized(12).colors(
                                                  Guide.isDark(context)
                                                      ? darkThemeText
                                                      : colorsBlack,
                                                ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 6.h,
                                              horizontal: 6.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: colorPrimary,
<<<<<<< HEAD
                                              borderRadius:
                                                  BorderRadius.circular(5.r),
=======
                                              borderRadius: BorderRadius.circular(5.r),
                                            ),
                                            child: Text(data[index].yoastHeadJson.schema.graph[0].articleSection.join(' | ')).boldSized(8).colors(
                                              Guide.isDark(context)
                                                  ? colorWhite
                                                  : colorWhite,
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
                                            ),
                                            child: Text(data[index].category)
                                                .boldSized(8)
                                                .colors(
                                                  Guide.isDark(context)
                                                      ? colorWhite
                                                      : colorWhite,
                                                ),
                                          ),
                                          SizedBox(
                                            width: 210.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    const Text('BY')
                                                        .boldSized(10)
                                                        .colors(colorTextGray),
                                                    SizedBox(
                                                      width: 7.w,
                                                    ),
                                                    Text(
<<<<<<< HEAD
                                                      data[index]
                                                          .author
                                                          .toUpperCase(),
=======
                                                      data[index].yoastHeadJson.author.toUpperCase(),
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
                                                    )
                                                        .boldSized(10)
                                                        .colors(colorTextGray)
                                                  ],
                                                ),
                                                Text(
                                                  timeago.format(
                                                    data[index].date,
                                                  ),
                                                )
                                                    .boldSized(10)
                                                    .colors(colorTextGray),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                    },
                  );
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }
}
