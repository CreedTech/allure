import 'package:allure/components/component_style.dart';
import 'package:allure/helpers/helper_routes_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../components/component_theme.dart';
import '../../../helpers/helper_utils.dart';
import '../../home/bloc/theme/theme_mode_bloc.dart';

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
