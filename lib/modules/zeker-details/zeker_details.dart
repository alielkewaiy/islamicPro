import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/cubit/cubit.dart';
import 'package:islamic/layout/states/states.dart';
import 'package:islamic/models/zeker-model.dart';
import 'package:vibration/vibration.dart';

class ZekerDetailsScreen extends StatefulWidget {
  List<ZekerData> zekeList = [];
  bool changeImage = false;
  ZekerDetailsScreen(this.zekeList);

  @override
  State<ZekerDetailsScreen> createState() => _ZekerDetailsScreenState();
}

class _ZekerDetailsScreenState extends State<ZekerDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IslamicCubit(),
      child: BlocConsumer<IslamicCubit, IslamicStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black87,
              elevation: 0,
              title: Text(widget.zekeList[0].category!),
            ),
            body: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/wood31.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Container(
                color: Colors.black26,
                child: ListView.separated(
                    itemBuilder: (context, index) => zekerBuildItem(
                        widget.zekeList[index].zeker,
                        widget.zekeList[index].count,
                        index,
                        widget.zekeList[index].description,
                        widget.zekeList[index].reference,
                        context),
                    separatorBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Container(
                            color: Colors.yellow,
                            height: .5,
                          ),
                        ),
                    itemCount: widget.zekeList.length),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget zekerBuildItem(String? text, String? count, int index, String? des,
          String? ref, context) =>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(15),
              border: Border.all(color: Colors.yellowAccent, width: 3),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text!,
                          softWrap: false,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.yellowAccent, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (des!.isNotEmpty)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadiusDirectional.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                des,
                                softWrap: false,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (ref!.isNotEmpty)
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadiusDirectional.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                ref,
                                softWrap: false,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ),
                        const SizedBox(
                          height: 10,
                        ),
                        if (count!.isNotEmpty)
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  int count =
                                      int.parse(widget.zekeList[index].count!);

                                  setState(() {
                                    if (count > 0) {
                                      count--;
                                      widget.zekeList[index].count =
                                          count.toString();
                                      if (count == 0) {
                                        Vibration.vibrate(duration: 100);
                                      }
                                    }
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 40,
                                  backgroundImage:
                                      AssetImage('assets/images/btn1.jpg'),
                                ),
                              ),
                              const Spacer(),
                              Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            'assets/images/border1.jpg'))),
                                child: Text(
                                  '${widget.zekeList[index].count}',
                                  style: const TextStyle(
                                      color: Colors.yellowAccent, fontSize: 24),
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  ),
                ),
              ],
            )),
      );
}
