import 'package:asset_cache/asset_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/cubit/cubit.dart';
import 'package:islamic/layout/home_layout/home.dart';
import 'package:islamic/layout/states/states.dart';
import 'package:islamic/modules/after_prayer/after%20_prayer_screen.dart';
import 'package:islamic/modules/reading_continue/reading_Screen.dart';
import 'package:islamic/modules/swam/swam_screen.dart';
import 'package:islamic/modules/the_menu/menu_screen.dart';
import 'package:islamic/modules/zeker/zeker_screen.dart';
import 'package:islamic/shared/component/constaent/constant.dart';
import 'package:islamic/shared/components/applocal.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamic/shared/network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  if (CacheHelper.getData(key: 'pageNumber') == null) {
    CacheHelper.saveData(key: 'pageNumber', value: 4);

    final imageCache = ImageAssetCache(basePath: "assets/images/");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IslamicCubit(),
      child: BlocConsumer<IslamicCubit, IslamicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MenuScreen(),
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('ar', ''), //Arabic, no country code
            ],
            localeResolutionCallback: (currentLang, supportLang) {
              if (currentLang != null) {
                for (Locale locale in supportLang) {
                  if (locale.languageCode == currentLang.languageCode) {
                    return currentLang;
                  }
                }
              }
              return supportLang.first;
            },
          );
        },
      ),
    );
  }
}
