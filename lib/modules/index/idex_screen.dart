import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/cubit/cubit.dart';
import 'package:islamic/layout/states/states.dart';
import 'package:islamic/modules/reading_continue/reading_Screen.dart';
import 'package:islamic/shared/network/local/cache_helper.dart';

class IndexScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IslamicCubit(),
      child: BlocConsumer<IslamicCubit, IslamicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/wood31.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Container(
              color: Colors.black38,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildIndexItem(
                          index,
                          IslamicCubit.get(context).names[index],
                          IslamicCubit.get(context).pageNumbers[index],
                          context),
                      separatorBuilder: (context, index) => Container(
                            height: 2,
                            color: Colors.white38,
                          ),
                      itemCount: IslamicCubit.get(context).names.length),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }

  Widget buildIndexItem(int index, String name, int pageNumber, context) =>
      Container(
        height: 70,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            CacheHelper.saveData(key: 'pageNumber', value: pageNumber);
            navigateTo(context, ReadingScreen(pageNumber - 1));
          },
          child: Row(
            children: [
              Container(
                  width: 50,
                  color: Colors.black45,
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                          color: Colors.lime,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
              const SizedBox(
                width: 10,
              ),
              Center(
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.lime),
                ),
              ),
              const Spacer(),
              Container(
                width: 50,
                color: Colors.black45,
                child: Center(
                  child: Text('$pageNumber',
                      style: TextStyle(
                          color: Colors.lime,
                          fontSize: 18,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
        ),
      );

  void navigateTo(context, widget) =>
      Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
