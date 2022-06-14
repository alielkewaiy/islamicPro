import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/cubit/cubit.dart';
import 'package:vibration/vibration.dart';
import 'package:wheel_chooser/wheel_chooser.dart';

import '../../layout/states/states.dart';

class SwamScreen extends StatefulWidget {
  @override
  _SwamScreenState createState() => _SwamScreenState();
}

class _SwamScreenState extends State<SwamScreen> {
  int nu = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => IslamicCubit(),
        child: BlocConsumer<IslamicCubit, IslamicStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              body: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/wood31.jpg"),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  color: Colors.black38,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    " التسبيح",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.yellowAccent),
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Container(
                                      width: 120,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.4),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${IslamicCubit.get(context).tasbeh}',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "التكبير ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.yellowAccent),
                                  ),
                                  const SizedBox(
                                    width: 110,
                                  ),
                                  Container(
                                      width: 120,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.4),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${IslamicCubit.get(context).takber}',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    " التحميد",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.yellowAccent),
                                  ),
                                  const SizedBox(
                                    width: 100,
                                  ),
                                  Container(
                                      width: 120,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.4),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${IslamicCubit.get(context).thmed}',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "الاستغفار ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.yellowAccent),
                                  ),
                                  const SizedBox(
                                    width: 85,
                                  ),
                                  Container(
                                      width: 120,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.4),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${IslamicCubit.get(context).stekhfar}',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "الصلاه علي النبي ",
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.yellowAccent),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                      width: 120,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(.4),
                                          borderRadius:
                                              BorderRadiusDirectional.circular(
                                                  20)),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            '${IslamicCubit.get(context).slahalaehnabe}',
                                            style: const TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      IslamicCubit.get(context)
                                          .swamBtnPressed();
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        backgroundImage: const AssetImage(
                                            "assets/images/btn1.jpg"),
                                        radius: 40,
                                        child: MaterialButton(onPressed: () {
                                          IslamicCubit.get(context)
                                              .swamBtnPressed();
                                        })),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      IslamicCubit.get(context).reset();
                                    },
                                    child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        radius: 30,
                                        child: Container(
                                            width: 20,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/reset2.png"),
                                                  fit: BoxFit.contain),
                                            ),
                                            child:
                                                MaterialButton(onPressed: () {
                                              IslamicCubit.get(context).reset();
                                              Vibration.vibrate(duration: 200);
                                            }))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(15),
                                      border: Border.all(
                                          color: Colors.lime, width: 2),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: WheelChooser(
                                        listWidth: 250,
                                        listHeight: 100,
                                        magnification: 1.5,
                                        unSelectTextStyle: const TextStyle(
                                            fontSize: 18, color: Colors.white),
                                        selectTextStyle: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.yellowAccent,
                                            fontWeight: FontWeight.bold),
                                        onValueChanged: (s) {
                                          IslamicCubit.get(context)
                                              .wheelChanged(s);
                                        },
                                        datas: [
                                          "التسبيح",
                                          "التكبير",
                                          "التحميد",
                                          "الاستغفار",
                                          "الصلاه علي النبي",
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
