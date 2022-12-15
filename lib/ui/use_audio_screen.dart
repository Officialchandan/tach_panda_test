import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tach_panda_test/ui/text.dart';
import 'package:tach_panda_test/ui/ui_bloc/bloc_event.dart';
import 'package:tach_panda_test/ui/ui_bloc/bloc_state.dart';
import 'package:tach_panda_test/ui/ui_bloc/ui_bloc.dart';

import 'constant/colors.dart';

class UseAudioScreen extends StatefulWidget {
  const UseAudioScreen({Key? key}) : super(key: key);

  @override
  State<UseAudioScreen> createState() => _UseAudioScreenState();
}

class _UseAudioScreenState extends State<UseAudioScreen> {
  final progress = const Duration(milliseconds: 100);
  final buffered = const Duration(milliseconds: 100);
  final total = const Duration(milliseconds: 100);
  bool switchValue = false;

  UIBloc uiBloc = UIBloc();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => UIBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.colorPrimary,
          leading: Row(
            children: [
              const SizedBox(
                width: 13,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop('');
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColor.searchBarColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Icon(
                    Icons.close,
                    size: 23,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            decoration: BoxDecoration(
              color: AppColor.searchBarColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.music_note_rounded,
                  size: 26,
                  color: Colors.white,
                ),
                Text(
                  "Music",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: Container(
          child: Stack(
            children: [
              Positioned(
                top: h / 6.3,
                right: 20,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xFFFFFFFF),
                          maxRadius: 30,
                          child: Icon(Icons.access_time_outlined,
                              color: Colors.black87, size: 42),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Timer",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xFFFFFFFF),
                          maxRadius: 30,
                          child: Icon(Icons.emoji_emotions_outlined,
                              color: Colors.pinkAccent, size: 42),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Filter",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: const [
                        CircleAvatar(
                          backgroundColor: Color(0xFFFFFFFF),
                          maxRadius: 30,
                          child: Icon(Icons.person_sharp,
                              color: Colors.black87, size: 42),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Beauty",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 4),
                              // decoration: BoxDecoration(
                              //   color: AppColor.searchBarColor,
                              //   borderRadius: BorderRadius.circular(8.0),
                              // ),
                              child: const Text(
                                "15s",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColor.searchBarColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Text(
                                "30s",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 4),
                              // decoration: BoxDecoration(
                              //   color: AppColor.searchBarColor,
                              //   borderRadius: BorderRadius.circular(8.0),
                              // ),
                              child: const Text(
                                "60s",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ProgressBar(
                        progress: progress,
                        buffered: buffered,
                        total: total,
                        thumbCanPaintOutsideBar: true,
                        progressBarColor: Colors.orange,
                        // baseBarColor: Colors.white.withOpacity(0.24),
                        // bufferedBarColor: Colors.white.withOpacity(0.24),
                        thumbColor: Colors.white,
                        barHeight: 3.0,
                        thumbRadius: 7.0,
                        timeLabelLocation: TimeLabelLocation.none,
                        onSeek: (duration) {},
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 4),
                              decoration: BoxDecoration(
                                color: AppColor.searchBarColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 24,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Photo",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          BlocConsumer(
                            builder: (context, state) {
                              if (state is SwitchState) {
                                switchValue = state.isSwitch;
                              }
                              return SizedBox(
                                width: 150,
                                height: 40,
                                child: FittedBox(
                                  fit: BoxFit.fill,
                                  child: Switch(
                                    trackColor: MaterialStateProperty.all(
                                        Colors.black38),
                                    activeColor: Colors.white,
                                    inactiveThumbColor:
                                        Colors.grey.withOpacity(0.9),
                                    value: switchValue,
                                    onChanged: (value) {
                                      uiBloc.add(SwitchEvent(isSwitch: value));
                                    },
                                  ),
                                ),
                              );
                            },
                            listener: (context, state) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CameraPage(),
                                ),
                              );
                            },
                            bloc: uiBloc,
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            "Video",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 21,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.5)),
                                child: const Icon(
                                    Icons.flip_camera_ios_outlined,
                                    color: Colors.orange,
                                    size: 25),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Camera Flip",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 80,
                              width: 80,
                              // padding: const EdgeInsets.symmetric(
                              //     horizontal: 9, vertical: 0),
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 4,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.circular(90.0)),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 9, vertical: 2),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.5)),
                                child: const Icon(Icons.photo,
                                    color: Colors.orange, size: 25),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                "Gallery",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
