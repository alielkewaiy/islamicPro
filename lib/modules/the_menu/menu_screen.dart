import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islamic/modules/after_prayer/after%20_prayer_screen.dart';
import 'package:islamic/modules/index/idex_screen.dart';
import 'package:islamic/modules/reading_continue/reading_Screen.dart';
import 'package:islamic/modules/swam/swam_screen.dart';
import 'package:islamic/modules/zeker/zeker_screen.dart';
import 'package:islamic/shared/components/compomemts.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../shared/network/local/cache_helper.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/wood31.jpg"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          navigateTo(
                              context,
                              ReadingScreen(
                                  CacheHelper.getData(key: 'pageNumber')));
                        },
                        child: Container(
                          width: 250,
                          height: 85,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              border:
                                  Border.all(color: Colors.black54, width: 2),
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(7, 9),
                                )
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 60, right: 60, top: 20, bottom: 20),
                            child: AutoSizeText(
                              'المصحف',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          navigateTo(context, IndexScreen());
                        },
                        child: Container(
                          width: 250,
                          height: 85,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              border:
                                  Border.all(color: Colors.black54, width: 2),
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(7, 9),
                                )
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 60, right: 60, top: 20, bottom: 20),
                            child: AutoSizeText(
                              'الفهرس',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          navigateTo(context, AfterPrayerScreen());
                        },
                        child: Container(
                          width: 250,
                          height: 85,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              border:
                                  Border.all(color: Colors.black54, width: 2),
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(7, 9),
                                )
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 40, right: 40, top: 20, bottom: 20),
                            child: AutoSizeText(
                              'أذكار بعد الصلاة',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          navigateTo(context, SwamScreen());
                        },
                        child: Container(
                          width: 250,
                          height: 85,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              border:
                                  Border.all(color: Colors.black54, width: 2),
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(7, 9),
                                )
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 60, right: 60, top: 20, bottom: 20),
                            child: Text(
                              'تسبيح',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          navigateTo(context, ZekerScreen());
                        },
                        child: Container(
                          width: 250,
                          height: 85,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              border:
                                  Border.all(color: Colors.black54, width: 2),
                              borderRadius:
                                  BorderRadiusDirectional.circular(20),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black38,
                                  offset: Offset(7, 9),
                                )
                              ]),
                          child: const Padding(
                            padding: EdgeInsets.only(
                                left: 40, right: 40, top: 20, bottom: 20),
                            child: AutoSizeText(
                              'أذكار و أدعية',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
