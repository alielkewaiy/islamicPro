import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/cubit/cubit.dart';
import 'package:islamic/modules/index/idex_screen.dart';
import 'package:islamic/modules/reading_continue/reading_Screen.dart';
import '../states/states.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IslamicCubit, IslamicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: IndexScreen(),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: 1,
              onTap: (index) {},
              items: IslamicCubit.get(context).bottomItems,
            ),
          );
        });
  }
}
