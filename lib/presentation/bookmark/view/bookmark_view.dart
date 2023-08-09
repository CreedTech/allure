<<<<<<< HEAD
import 'package:allure/components/component_style.dart';
import 'package:allure/helpers/helper_routes_path.dart';
=======

import 'package:cached_network_image/cached_network_image.dart';
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

<<<<<<< HEAD
import '../../../components/component_theme.dart';
import '../../../helpers/helper_utils.dart';
import '../../home/bloc/theme/theme_mode_bloc.dart';
=======
import '../../../core/core.dart';
import '../../../domain/entitites/news_entities.dart';
import '../../home/widget/trending_skeleton_widget.dart';
import '../bloc/bookmark/bookmark_news_bloc.dart';
import '../bloc/enum_explore_bloc.dart';
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
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
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        backgroundColor: Guide.isDark(context) ? colorsBlack : colorWhite,
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Settings",
            ).blackSized(20).colors(
                  Guide.isDark(context) ? darkThemeText : colorsBlack,
                ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(
              //     top: 10.h,
              //     bottom: 20.h,
              //     left: 10.w,
              //     right: 10.w,
              //   ),
              //   child: Center(
              //     child: Container(
              //       height: 100.h,
              //       width: 300.w,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(10.r),
              //         image: DecorationImage(
              //           image: Guide.isDark(context) == false
              //               ? const AssetImage(
              //                   'assets/images/splash_image.jpg',
              //                 )
              //               : const AssetImage(
              //                   'assets/images/splash_image.jpg'),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              ListTile(
                title: Text(
                  "Light Mode",
                  style: TextStyle(
                    // fontSize: 18.sp,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  ),
                ),
                trailing: BlocBuilder<ThemeModeBloc, ThemeModeState>(
                  builder: (_, state) {
                    return Switch(
                      value: state.isDarkMode,
                      onChanged: (value) {
                        BlocProvider.of<ThemeModeBloc>(context)
                            .add(const ChangeThemeModeEvent());
                      },
                      activeColor: colorPrimary,
                      activeTrackColor: darkThemeText,
                      inactiveThumbColor: colorPrimary,
                      inactiveTrackColor: borderGray,
                    );
                  },
                ),
                leading: Icon(
                  Guide.isDark(context)
                      ? Icons.brightness_4_outlined
                      : Icons.brightness_7,
                  color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  size: 20.w,
                ),
              ),
<<<<<<< HEAD
              ListTile(
                title: Text(
                  "About Us",
                  style: TextStyle(
                    // fontSize: 18.sp,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  ),
                ),
                leading: Icon(
                  Guide.isDark(context)
                      ? Icons.info_outline
                      : Icons.info_outline,
                  color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  size: 20.w,
                ),
                onTap: () {
                  _launchInBrowser(
                      Uri.parse('https://www.vanguardngr.com/about/'));
                },
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: TextStyle(
                    // fontSize: 18.sp,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  ),
                ),
                leading: Icon(
                  Guide.isDark(context)
                      ? Icons.phone_iphone_outlined
                      : Icons.phone_iphone_outlined,
                  color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  size: 20.w,
                ),
                onTap: () => Guide.to(
                  name: contactUs,
                ),
              ),
              ListTile(
                title: Text(
                  "Advertise With Us",
                  style: TextStyle(
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  ),
                ),
                leading: Icon(
                  Guide.isDark(context)
                      ? Icons.newspaper_outlined
                      : Icons.newspaper_outlined,
                  color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  size: 20.w,
                ),
                onTap: () {
                  _launchInBrowser(Uri.parse(
                      'https://www.vanguardngr.com/advertise-with-us-now/'));
                },
              ),
              ListTile(
                title: Text(
                  "Privacy Policy",
                  style: TextStyle(
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  ),
                ),
                leading: Icon(
                  Guide.isDark(context)
                      ? Icons.newspaper_outlined
                      : Icons.newspaper_outlined,
                  color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  size: 20.w,
                ),
                onTap: () {
                  _launchInBrowser(
                      Uri.parse('https://www.vanguardngr.com/privacy-policy/'));
                },
              ),
              ListTile(
                title: Text(
                  "Rate Us",
                  style: TextStyle(
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  ),
                ),
                leading: Icon(
                  Guide.isDark(context)
                      ? Icons.star_border_outlined
                      : Icons.star_border_outlined,
                  color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  size: 20.w,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return AlertDialog(
                        title: const Text(
                          "Rate Our App",
                        ),
                        content: Text(
                          'COMING SOON!!!',
                          style: TextStyle(
                            fontSize: 15.sp,
=======
            ),
            child: BlocBuilder<BookmarkNewsBloc, BookmarkNewsState>(
              builder: (_, state) {
                if (state.status == BookmarkBlocStatus.loading) {
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 5.h,
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
                if (state.status == BookmarkBlocStatus.loaded) {
                  final data = state.response?.articles ?? [];

                  return data.isNotEmpty
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (c, index) {
                            return Dismissible(
                              key: ObjectKey(data[index]),
                              onDismissed: (direction) {
                                context.read<BookmarkNewsBloc>().add(
                                      BookmarkNewsRemoveEvent(
                                        remove: data,
                                      ),
                                    );
                              },
                              background: Container(
                                color: Colors.red,
                                alignment: Alignment.centerRight,
                              ),
                              secondaryBackground: Container(
                                margin: EdgeInsets.symmetric(horizontal: 15.w),
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Colors.red,
                                  border: Border.all(
                                    width: 0.5,
                                    color: Guide.isDark(context)
                                        ? Colors.grey.withOpacity(0.5)
                                        : borderGray,
                                  ),
                                ),
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.delete,
                                  size: 30.h,
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () => Guide.to(
                                  name: detail,
                                  arguments: data[index],
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  child: Container(
                                    height: 120.h,
                                    margin: EdgeInsets.only(top: 8.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      color: Guide.isDark(context)
                                          ? colorsBlack
                                          : colorWhite,
                                      border: Border.all(
                                        width: 0.5,
                                        color: Guide.isDark(context)
                                            ? Colors.grey.withOpacity(0.5)
                                            : borderGray,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          child: SizedBox(
                                            width: 120.w,
                                            height: 120.h,
                                            child: CachedNetworkImage(
                                              // imageUrl: data[index].source.ogImage[0].url,
                                              imageUrl: data[index].yoastHeadJson.ogImage[0].url,
                                              imageBuilder: (c, image) =>
                                                  Container(
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
                                            horizontal: 8.w,
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
                                                  data[index].title.rendered,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ).boldSized(14).colors(
                                                      Guide.isDark(context)
                                                          ? darkThemeText
                                                          : colorsBlack,
                                                    ),
                                              ),
                                              SizedBox(
                                                width: 220.w,
                                                child: Text(
                                                  data[index].content.rendered,
                                                  maxLines: 3,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ).normalSized(12).colors(
                                                      Guide.isDark(context)
                                                          ? darkThemeText
                                                          : colorsBlack,
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

                                                        SizedBox(
                                                          width: 7.w,
                                                        ),
                                                        Text(data[index]
                                                                .yoastHeadJson!
                                                                .author)
                                                            .boldSized(10)
                                                            .colors(
                                                                colorTextGray)
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
                                ),
                              ),
                            );
                          })
                      : SizedBox(
                          height: 700.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/empty.svg",
                                width: 100.w,
                                height: 200.h,
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              const Text("There is no data saved")
                                  .boldSized(20)
                                  .colors(
                                    Guide.isDark(context)
                                        ? darkThemeText
                                        : colorTextGray,
                                  ),
                              SizedBox(
                                height: 100.h,
                              ),
                              SizedBox(
                                height: 10.h,
                                child: ListView(),
                              ),
                            ],
>>>>>>> 853b112d808ffa868101a04f1b695c9b15eefa24
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              ListTile(
                title: Text(
                  "Share App",
                  style: TextStyle(
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  ),
                ),
                leading: Icon(
                  Guide.isDark(context)
                      ? Icons.share_outlined
                      : Icons.share_outlined,
                  color: Guide.isDark(context) ? colorWhite : colorsBlack,
                  size: 20.w,
                ),
                onTap: () {
                  Share.share(
                    'Share feature coming soon',
                    subject: 'Coming Soon',
                  );
                },
              ),
              const Spacer(),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Follow us',
                      style: TextStyle(
                        color: Guide.isDark(context) ? colorWhite : colorsBlack,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () => {
                              _launchInBrowser(Uri.parse(
                                  'https://facebook.com/vanguardallure')),
                            },
                            icon: Icon(
                              Guide.isDark(context)
                                  ? FontAwesomeIcons.facebook
                                  : FontAwesomeIcons.facebook,
                              color: Guide.isDark(context)
                                  ? colorPrimary
                                  : colorPrimary,
                              size: 32.w,
                            ),
                          ),
                          IconButton(
                            onPressed: () => {
                              _launchInBrowser(Uri.parse(
                                  'https://instagram.com/vanguardallure')),
                            },
                            icon: Icon(
                              Guide.isDark(context)
                                  ? FontAwesomeIcons.instagram
                                  : FontAwesomeIcons.instagram,
                              color: Guide.isDark(context)
                                  ? colorPrimary
                                  : colorPrimary,
                              size: 32.w,
                            ),
                          ),
                          IconButton(
                            onPressed: () => {
                              launchUrl(Uri.parse(
                                  'https://twitter.com/vanguardallure')),
                            },
                            icon: Icon(
                              Guide.isDark(context)
                                  ? FontAwesomeIcons.twitter
                                  : FontAwesomeIcons.twitter,
                              color: Guide.isDark(context)
                                  ? colorPrimary
                                  : colorPrimary,
                              size: 32.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
