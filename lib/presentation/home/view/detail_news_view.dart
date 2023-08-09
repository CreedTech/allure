import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../bookmark/bloc/bookmark/bookmark_news_bloc.dart';

class DetailNewsView extends StatelessWidget {
  final List<NewsArticleEntities> response;
  const DetailNewsView({
    super.key,
    required this.response,
  });

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<BookmarkNewsBloc, BookmarkNewsState>(
        listener: (_, state) {},
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 350.h,
              floating: true,
              pinned: true,
              title: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: Guide.isDark(context) ? colorsBlack : colorWhite,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(
                  Uri.parse(response[0].yoastHeadJson.ogUrl).host,
                ).normalSized(15).colors(Guide.isDark(context) ? colorWhite : colorPrimary),
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
              leading: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: Guide.isDark(context) ? colorsBlack : colorWhite,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 2.h),
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color:
                          Guide.isDark(context) ? colorPrimary : colorPrimary,
                    ),
                  ),
                ),
              ),

              actions: [
                Container(
                    decoration: BoxDecoration(
                      color: Guide.isDark(context) ? colorsBlack : colorWhite,
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    margin:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 2.h),
                    child: IconButton(
                      onPressed: () {
                        Share.share(
                          response[0].link,
                          subject: response[0].title,
                        );
                      },
                      icon: Icon(
                        Icons.share_outlined,
                        color:
                            Guide.isDark(context) ? colorPrimary : colorPrimary,
                      ),
                    )),
              ],
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
                collapseMode: CollapseMode.parallax,
                background: SizedBox(
                  width: 120.w,
                  height: 100.h,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        // imageUrl: response[0].source.ogImage[0].url,
                        imageUrl: response[0].yoastHeadJson.ogImage[0].url,
                        imageBuilder: (c, image) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: image,
                              fit: BoxFit.cover,
                              colorFilter: Guide.isDark(context)
                                  ? ColorFilter.mode(
                                      Colors.black.withOpacity(0.9),
                                      BlendMode.softLight,
                                    )
                                  : ColorFilter.mode(
                                      Colors.black.withOpacity(0.8),
                                      BlendMode.softLight,
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: -1,
                        right: 0,
                        left: 0,
                        child: Column(
                          children: [
                            Container(
                              height: 15.h,
                              decoration: BoxDecoration(
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? colorsBlack
                                    : colorWhite,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25.r),
                                  topRight: Radius.circular(25.r),
                                ),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 170.w, vertical: 12.h),
                                child: Divider(
                                  color: Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? colorWhite
                                      : borderGray,
                                  thickness: 3.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r)),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  decoration: BoxDecoration(
                    color: Guide.isDark(context) ? colorsBlack : colorWhite,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 55.h,
                        padding: EdgeInsets.symmetric(vertical: 4.w),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                  width: 350.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Article By")
                                          .normalSized(11)
                                          .colors(
                                            Guide.isDark(context)
                                                ? darkThemeText
                                                : colorTextGray,
                                          ),
                                      Text(
                                        DateFormat.yMMMMEEEEd()
                                            .format(response[0].date),
                                      ).normalSized(11).colors(
                                            Guide.isDark(context)
                                                ? darkThemeText
                                                : colorTextGray,
                                          ),
                                    ],
                                  ),
                                ),

                               SizedBox(
                                 width: 350.w,
                                 child: Row(
                                   mainAxisAlignment:
                                   MainAxisAlignment.spaceBetween,
                                   children: [
                                     Text(
                                       response[0].yoastHeadJson.author.toUpperCase(),
                                       maxLines: 1,
                                       overflow: TextOverflow.ellipsis,
                                     ).boldSized(17).colors(
                                       Guide.isDark(context)
                                           ? darkThemeText
                                           : colorTextGray,
                                     ),
                                     Container(
                                       padding: EdgeInsets.symmetric(
                                         vertical: 6.h,
                                         horizontal: 6.w,
                                       ),
                                       decoration: BoxDecoration(
                                         color: colorPrimary,
                                         borderRadius: BorderRadius.circular(5.r),
                                       ),
                                       child: Text(response[0].yoastHeadJson.schema.graph[0].articleSection.join(' | ')).boldSized(8).colors(
                                         Guide.isDark(context)
                                             ? colorWhite
                                             : colorWhite,
                                       ),
                                     ),
                                   ],
                                 ),
                               ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        response[0].title.rendered,
                      ).blackSized(20).colors(
                            Guide.isDark(context) ? darkThemeText : colorsBlack,
                          ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        child: Text(
                          response[0].content.rendered,
                        ).normalSized(13).colors(
                              Guide.isDark(context)
                                  ? darkThemeText
                                  : colorTextGray,
                            ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        child: Text(
                          response[0].link,
                        ).normalSized(10).colors(Guide.isDark(context) ? colorWhite : colorPrimary),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// import 'package:allure/components/component_style.dart';
// import 'package:allure/domain/entities/article_entity.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
//
// import '../../../components/component_theme.dart';
// import '../../../helpers/helper_utils.dart';
// import '../../bookmark/bloc/bookmark/bookmark_news_bloc.dart';

// class DetailNewsView extends StatelessWidget {
//   final List<ArticleEntity> response;
//   const DetailNewsView({
//     super.key,
//     required this.response,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<BookmarkNewsBloc, BookmarkNewsState>(
//         listener: (_, state) {},
//         child: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 350.h,
//               floating: true,
//               pinned: true,
//               title: Container(
//                 padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
//                 decoration: BoxDecoration(
//                   color: Guide.isDark(context) ? colorsBlack : colorWhite,
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: Text(
//                   Uri.parse(response[0].link).host,
//                 )
//                     .normalSized(15)
//                     .colors(Guide.isDark(context) ? colorWhite : colorPrimary),
//               ),
//               centerTitle: true,
//               elevation: 0,
//               backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
//               leading: IconButton(
//                 onPressed: () => Navigator.of(context).pop(),
//                 icon: Icon(
//                   Icons.arrow_back_ios_new,
//                   color: Guide.isDark(context) ? colorWhite : colorWhite,
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: ()
//                       {
//                       // =>
//                       context
//                           .read<BookmarkNewsBloc>()
//                           .add(BookmarkNewsAddEvent(add: response));
//                       print("added");
//                       print(response);
//                   },
//                   icon: Icon(
//                     Icons.bookmark_add,
//                     color: Guide.isDark(context) ? colorPrimary : colorPrimary,
//                   ),
//                 )
//               ],
//               flexibleSpace: FlexibleSpaceBar(
//                 centerTitle: true,
//                 titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
//                 collapseMode: CollapseMode.parallax,
//                 background: SizedBox(
//                   width: 120.w,
//                   height: 100.h,
//                   child: Stack(
//                     children: [
//                       CachedNetworkImage(
//                         // imageUrl: response[0].source.ogImage[0].url,
//                         imageUrl: response[0].yoastHeadJson.ogImage![0].url!,
//                         imageBuilder: (c, image) => Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: image,
//                               fit: BoxFit.cover,
//                               colorFilter: Guide.isDark(context)
//                                   ? ColorFilter.mode(
//                                       Colors.black.withOpacity(0.9),
//                                       BlendMode.softLight,
//                                     )
//                                   : ColorFilter.mode(
//                                       Colors.black.withOpacity(0.8),
//                                       BlendMode.softLight,
//                                     ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         bottom: -1,
//                         right: 0,
//                         left: 0,
//                         child: Column(
//                           children: [
//                             Container(
//                               height: 15.h,
//                               decoration: BoxDecoration(
//                                 color: Theme.of(context).brightness ==
//                                         Brightness.dark
//                                     ? colorsBlack
//                                     : colorWhite,
//                                 borderRadius: BorderRadius.only(
//                                   topLeft: Radius.circular(25.r),
//                                   topRight: Radius.circular(25.r),
//                                 ),
//                               ),
//                               child: Container(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 170.w, vertical: 12.h),
//                                 child: Divider(
//                                   color: Theme.of(context).brightness ==
//                                           Brightness.dark
//                                       ? colorWhite
//                                       : borderGray,
//                                   thickness: 3.5,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             SliverToBoxAdapter(
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r)),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 10.w),
//                   decoration: BoxDecoration(
//                     color: Guide.isDark(context) ? colorsBlack : colorWhite,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Container(
//                         height: 55.h,
//                         padding: EdgeInsets.symmetric(vertical: 4.w),
//                         child: Row(
//                           children: [
//                             SizedBox(
//                               width: 10.w,
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 SizedBox(
//                                   width: 350.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       const Text("Article By")
//                                           .normalSized(11)
//                                           .colors(
//                                             Guide.isDark(context)
//                                                 ? darkThemeText
//                                                 : colorTextGray,
//                                           ),
//                                       Text(
//                                         DateFormat.yMMMMEEEEd()
//                                             .format(response[0].date),
//                                       ).normalSized(11).colors(
//                                             Guide.isDark(context)
//                                                 ? darkThemeText
//                                                 : colorTextGray,
//                                           ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 350.w,
//                                   child: Row(
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         response[0].author.toUpperCase(),
//                                         maxLines: 1,
//                                         overflow: TextOverflow.ellipsis,
//                                       ).boldSized(17).colors(
//                                             Guide.isDark(context)
//                                                 ? darkThemeText
//                                                 : colorTextGray,
//                                           ),
//                                       Container(
//                                         padding: EdgeInsets.symmetric(
//                                           vertical: 6.h,
//                                           horizontal: 6.w,
//                                         ),
//                                         decoration: BoxDecoration(
//                                           color: colorPrimary,
//                                           borderRadius:
//                                               BorderRadius.circular(5.r),
//                                         ),
//                                         child: Text(response[0].category)
//                                             .boldSized(8)
//                                             .colors(
//                                               Guide.isDark(context)
//                                                   ? colorWhite
//                                                   : colorWhite,
//                                             ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Text(
//                         response[0].title,
//                       ).blackSized(20).colors(
//                             Guide.isDark(context)
//                                 ? darkThemeText
//                                 : colorTextGray,
//                           ),
//                       SizedBox(
//                         height: 20.h,
//                       ),
//                       Container(
//                         child: Text(
//                           response[0].description,
//                         ).normalSized(13).colors(
//                               Guide.isDark(context)
//                                   ? darkThemeText
//                                   : colorTextGray,
//                             ),
//                       ),
//                       SizedBox(
//                         height: 10.h,
//                       ),
//                       Container(
//                         child: Text(
//                           response[0].link,
//                         ).normalSized(10).colors(
//                             Guide.isDark(context) ? colorWhite : colorPrimary),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:allure/components/component_style.dart';
// import 'package:allure/domain/entities/article_entity.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
//
// import '../../../components/component_theme.dart';
// import '../../../domain/entities/article_detail_entity.dart';
// import '../../../helpers/helper_utils.dart';
// import '../../../injector.dart';
// import '../../bookmark/bloc/bookmark/bookmark_cubit.dart';
// import '../../bookmark/bloc/bookmark/bookmark_news_bloc.dart';
// import '../bloc/article_detail/article_detail_cubit.dart';
//
// class DetailNewsView extends StatefulWidget {
//   final ArticleDetailEntity response;
//   const DetailNewsView({
//     super.key,
//     required this.response,
//   });
//
//   @override
//   State<DetailNewsView> createState() => _DetailNewsViewState();
// }
//
// class _DetailNewsViewState extends State<DetailNewsView> {
//   // final ArticleDetailEntity articleDetailEntity;
//   late ArticleDetailCubit _articleDetailCubit;
//   late FavoriteCubit _favoriteCubit;
//
//   @override
//   void initState() {
//     super.initState();
//     _articleDetailCubit = sl<ArticleDetailCubit>();
//     _favoriteCubit = _articleDetailCubit.favoriteCubit;
//     // _movieDetailCubit.loadMovieDetail(widget.movieDetailArguments.movieId);
//   }
//
//   @override
//   void dispose() {
//     _articleDetailCubit.close();
//     // _castCubit.close();
//     // _videosCubit.close();
//     _favoriteCubit.close();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: MultiBlocProvider(
//         providers: [
//           BlocProvider.value(value: _articleDetailCubit),
//           BlocProvider.value(value: _favoriteCubit),
//         ],
//         child: Builder(builder: (context) {
//           return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
//               builder: (context, state) {
//                 return CustomScrollView(
//                   slivers: [
//                     SliverAppBar(
//                       expandedHeight: 350.h,
//                       floating: true,
//                       pinned: true,
//                       title: Container(
//                         padding:
//                         EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
//                         decoration: BoxDecoration(
//                           color: Guide.isDark(context) ? colorsBlack : colorWhite,
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                         child: Text(
//                           Uri.parse(widget.response.link).host,
//                         ).normalSized(15).colors(
//                             Guide.isDark(context) ? colorWhite : colorPrimary),
//                       ),
//                       centerTitle: true,
//                       elevation: 0,
//                       backgroundColor:
//                       Guide.isDark(context) ? colorsBlack : colorWhite,
//                       leading: IconButton(
//                         onPressed: () => Navigator.of(context).pop(),
//                         icon: Icon(
//                           Icons.arrow_back_ios_new,
//                           color: Guide.isDark(context) ? colorWhite : colorWhite,
//                         ),
//                       ),
//                       actions: [
//                         BlocBuilder<FavoriteCubit, FavoriteState>(
//                             builder: (context, state) {
//                               if (state is IsFavoriteArticle) {
//                                 return IconButton(
//                                   onPressed: () {
//                                     // =>
//                                     // context
//                                     //     .read<BookmarkNewsBloc>()
//                                     //     .add(BookmarkNewsAddEvent(add: response));
//                                     BlocProvider.of<FavoriteCubit>(context).toggleFavoriteArticle(
//                                       ArticleEntity.fromArticleDetailEntity(widget.response),
//                                       state.isArticleFavorite,
//                                     );
//                                     print("added");
//                                     print(widget.response);
//                                   },
//                                   icon: Icon(
//                                     state.isArticleFavorite
//                                         ?
//                                     Icons.favorite
//                                         : Icons.favorite_border,
//                                     color: Guide.isDark(context)
//                                         ? colorWhite
//                                         : colorPrimary,
//                                   ),
//                                 );
//                               } else {
//                                 return Icon(
//                                   Icons.favorite_border,
//                                   color:
//                                   Guide.isDark(context) ? colorWhite : colorPrimary,
//                                   // size: Sizes.dimen_12.h,
//                                 );
//                               }
//                             })
//                       ],
//                       flexibleSpace: FlexibleSpaceBar(
//                         centerTitle: true,
//                         titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
//                         collapseMode: CollapseMode.parallax,
//                         background: SizedBox(
//                           width: 120.w,
//                           height: 100.h,
//                           child: Stack(
//                             children: [
//                               CachedNetworkImage(
//                                 // imageUrl: response[0].source.ogImage[0].url,
//                                 imageUrl: widget.response.banner,
//                                 imageBuilder: (c, image) => Container(
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                       image: image,
//                                       fit: BoxFit.cover,
//                                       colorFilter: Guide.isDark(context)
//                                           ? ColorFilter.mode(
//                                         Colors.black.withOpacity(0.9),
//                                         BlendMode.softLight,
//                                       )
//                                           : ColorFilter.mode(
//                                         Colors.black.withOpacity(0.8),
//                                         BlendMode.softLight,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: -1,
//                                 right: 0,
//                                 left: 0,
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       height: 15.h,
//                                       decoration: BoxDecoration(
//                                         color: Theme.of(context).brightness ==
//                                             Brightness.dark
//                                             ? colorsBlack
//                                             : colorWhite,
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(25.r),
//                                           topRight: Radius.circular(25.r),
//                                         ),
//                                       ),
//                                       child: Container(
//                                         padding: EdgeInsets.symmetric(
//                                             horizontal: 170.w, vertical: 12.h),
//                                         child: Divider(
//                                           color: Theme.of(context).brightness ==
//                                               Brightness.dark
//                                               ? colorWhite
//                                               : borderGray,
//                                           thickness: 3.5,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: ClipRRect(
//                         borderRadius:
//                         BorderRadius.only(topLeft: Radius.circular(20.r)),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(horizontal: 10.w),
//                           decoration: BoxDecoration(
//                             color: Guide.isDark(context) ? colorsBlack : colorWhite,
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               Container(
//                                 height: 55.h,
//                                 padding: EdgeInsets.symmetric(vertical: 4.w),
//                                 child: Row(
//                                   children: [
//                                     SizedBox(
//                                       width: 10.w,
//                                     ),
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceAround,
//                                       children: [
//                                         SizedBox(
//                                           width: 350.w,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               const Text("Article By")
//                                                   .normalSized(11)
//                                                   .colors(
//                                                 Guide.isDark(context)
//                                                     ? darkThemeText
//                                                     : colorTextGray,
//                                               ),
//                                               Text(
//                                                 DateFormat.yMMMMEEEEd().format(
//                                                     widget.response.date),
//                                               ).normalSized(11).colors(
//                                                 Guide.isDark(context)
//                                                     ? darkThemeText
//                                                     : colorTextGray,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 350.w,
//                                           child: Row(
//                                             mainAxisAlignment:
//                                             MainAxisAlignment.spaceBetween,
//                                             children: [
//                                               Text(
//                                                 widget.response.author
//                                                     .toUpperCase(),
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                               ).boldSized(17).colors(
//                                                 Guide.isDark(context)
//                                                     ? darkThemeText
//                                                     : colorTextGray,
//                                               ),
//                                               Container(
//                                                 padding: EdgeInsets.symmetric(
//                                                   vertical: 6.h,
//                                                   horizontal: 6.w,
//                                                 ),
//                                                 decoration: BoxDecoration(
//                                                   color: colorPrimary,
//                                                   borderRadius:
//                                                   BorderRadius.circular(5.r),
//                                                 ),
//                                                 child: Text(
//                                                     widget.response.category)
//                                                     .boldSized(8)
//                                                     .colors(
//                                                   Guide.isDark(context)
//                                                       ? colorWhite
//                                                       : colorWhite,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               Text(
//                                 widget.response.title,
//                               ).blackSized(20).colors(
//                                 Guide.isDark(context)
//                                     ? darkThemeText
//                                     : colorTextGray,
//                               ),
//                               SizedBox(
//                                 height: 20.h,
//                               ),
//                               Container(
//                                 child: Text(
//                                   widget.response.description,
//                                 ).normalSized(13).colors(
//                                   Guide.isDark(context)
//                                       ? darkThemeText
//                                       : colorTextGray,
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: 10.h,
//                               ),
//                               Container(
//                                 child: Text(
//                                   widget.response.link,
//                                 ).normalSized(10).colors(Guide.isDark(context)
//                                     ? colorWhite
//                                     : colorPrimary),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 );
//               });
//         }),
//       ),
//     );
//   }
// }
