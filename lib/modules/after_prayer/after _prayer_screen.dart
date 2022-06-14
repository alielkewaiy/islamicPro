import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic/layout/cubit/cubit.dart';
import 'package:islamic/layout/states/states.dart';

class AfterPrayerScreen extends StatefulWidget {
  @override
  State<AfterPrayerScreen> createState() => _AfterPrayerScreenState();
}

class _AfterPrayerScreenState extends State<AfterPrayerScreen> {
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
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                      itemBuilder: (context, index) => dueaBuildItem(index,
                          IslamicCubit.get(context).texts[index], context),
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: IslamicCubit.get(context).texts.length),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget dueaBuildItem(int index, String dueaText, context) => Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(15),
            border: Border.all(color: Colors.white38, width: 3)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                dueaText,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      IslamicCubit.get(context).swam(index);
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage:
                          IslamicCubit.get(context).count[index] > 0
                              ? const AssetImage('assets/images/btn1.jpg')
                              : const AssetImage('assets/images/complete.png'),
                    ),
                  ),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/border.png'),
                        width: 80,
                        height: 80,
                      ),
                      Text(
                        '${IslamicCubit.get(context).count[index]}',
                        style: const TextStyle(
                            color: Colors.yellow,
                            fontSize: 23,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      IslamicCubit.get(context).reset1(index);
                    },
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image(
                          image: AssetImage('assets/images/reset2.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
