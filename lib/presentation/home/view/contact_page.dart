
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/core.dart';


class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

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
            Container(
              height: 100.h,
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: Guide.isDark(context) == false
                      ? const AssetImage(
                          'assets/images/splash_image.jpg',
                        )
                      : const AssetImage('assets/images/splash_image.jpg'),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
                    "General Enquires Phone Number",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text('+234 815 113 2811'),
                  leading: Icon(
                    Guide.isDark(context) ? Icons.phone : Icons.phone,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Citizen Report Phone Number",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text('+234 815 236 1852'),
                  leading: Icon(
                    Guide.isDark(context) ? Icons.phone : Icons.phone,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "General Enquires Email Address",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text('info@vanguardngr.com'),
                  leading: Icon(
                    Guide.isDark(context) ? Icons.mail : Icons.mail,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Citizen Report Email Address",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text('citizenreport@vanguardngr.com'),
                  leading: Icon(
                    Guide.isDark(context) ? Icons.mail : Icons.mail,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: const Text('OUR OFFICES').blackSized(20).colors(
                      Guide.isDark(context) ? darkThemeText : colorsBlack),
                ),
                ListTile(
                  title: Text(
                    "Head Office",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text(
                      '2 Vanguard Avenue, Kirikiri Canal, Apapa Lagos, P.M.B. 1007 Apapa Lagos'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Vanguard Digital",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle:
                      const Text('38/40 Association Avenue, Ilupeju, Lagos'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Ikeja Office",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text(
                      'Trinity Mall, 79 Obafemi Awolowo way Ikeja, Lagos'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Victoria Island office",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text(
                      'Slot Phones building Opposite Coscharis Motors, Akin Adesola, Victoria Island Lagos'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Abuja Office",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text(
                      '1 Vanguard Avenue opposite Asaba International Airport'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Warri Office",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle:
                      const Text('90 Warri/Sapele Road, Warri Delta State'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "(ii)",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text(
                      '102 Effurun / Sapele road, by airport junction. Warri'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Port Harcourt Office",
                    style: TextStyle(
                      // fontSize: 18.sp,
                      color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    ),
                  ),
                  subtitle: const Text(
                      '50, Ikwere Road, Port Harcourt, opposite mile 1 market'),
                  leading: Icon(
                    Guide.isDark(context)
                        ? Icons.location_city
                        : Icons.location_city,
                    color: Guide.isDark(context) ? colorWhite : colorsBlack,
                    size: 25.w,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
