import 'dart:async';

import 'package:allure/presentation/home/bloc/theme/theme_mode_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'components/component_constant.dart';
import 'components/component_theme.dart';
import 'data/tables/article_table.dart';
import 'helpers/helper_routes.dart';
import 'helpers/helper_routes_path.dart';
import 'helpers/helper_utils.dart';
import 'injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterSecureStorage storage = const FlutterSecureStorage();
  //
  // await storage.deleteAll();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(ArticleTableAdapter());
  unawaited(init());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setStatusBar();
    return BlocProvider<ThemeModeBloc>(
      create: (_) => sl<ThemeModeBloc>()..add(const ReadThemeModeEvent()),
      child: BlocBuilder<ThemeModeBloc, ThemeModeState>(
        builder: (_, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Allure Vanguard',
            theme: ligthTheme,
            darkTheme: darkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            builder: (c, w) {
              setUpScreenUtils(c);
              return MediaQuery(
                data: MediaQuery.of(c).copyWith(textScaleFactor: 1.0),
                child: ScrollConfiguration(
                  behavior: MyBehavior(),
                  child: w!,
                ),
              );
            },
            navigatorKey: sl<NavigatorHelper>().kNavKey,
            scaffoldMessengerKey: sl<NavigatorHelper>().kscaffoldMessengerKey,
            initialRoute: root,
            onGenerateRoute: sl<RouterGenerator>().generate,
          );
        },
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
