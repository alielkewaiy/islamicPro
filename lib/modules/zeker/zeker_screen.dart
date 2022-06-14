import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/cubit/cubit.dart';
import 'package:islamic/layout/states/states.dart';
import 'package:islamic/modules/zeker-details/zeker_details.dart';
import 'package:islamic/shared/components/compomemts.dart';

import '../../models/zeker-model.dart';

class ZekerScreen extends StatelessWidget {
  List<ZekerData> zekrList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IslamicCubit()..readJson(),
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
              child: ListView.separated(
                  itemBuilder: (context, index) => zekerBuildItem(
                      IslamicCubit.get(context).category[index], context),
                  separatorBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Container(
                          color: Colors.white24,
                          height: 4,
                        ),
                      ),
                  itemCount: IslamicCubit.get(context).category.length),
            ),
          );
        },
      ),
    );
  }

  Widget zekerBuildItem(String? text, context) => InkWell(
        onTap: () {
          zekrList = [];
          IslamicCubit.get(context).items.forEach((element) {
            if (element.category == text) {
              zekrList.add(element);
            }
          });
          navigateTo(context, ZekerDetailsScreen(zekrList));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white60,
                border: Border.all(color: Colors.black54, width: 2),
                borderRadius: BorderRadiusDirectional.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(7, 9),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                text!,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      );
}
