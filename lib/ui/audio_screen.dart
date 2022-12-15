import 'package:flutter/material.dart';
import 'package:tach_panda_test/ui/use_audio_screen.dart';

import 'constant/colors.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import 'just_logic.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> with WidgetsBindingObserver {
  final progress = const Duration(milliseconds: 100);
  final buffered = const Duration(milliseconds: 100);
  final total = const Duration(milliseconds: 100);

  List<String> myProducts = [
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
    "https://burst.shopifycdn.com/photos/city-lights-through-rain-window.jpg?width=1200&format=pjpg&exif=1&iptc=1",
  ];

  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    _player.playbackEventStream.listen((event) {},
        onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await _player.setAudioSource(
        AudioSource.uri(
          Uri.parse(
              "https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3"),
        ),
      );
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    ambiguate(WidgetsBinding.instance)!.removeObserver(this);
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _player.positionStream,
        _player.bufferedPositionStream,
        _player.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.colorPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop('');
          },
          icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
        ),
        centerTitle: true,
        title: const Text(
          "Audios",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 16,
            right: 16,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    child: ListTile(
                      leading: Container(
                        height: h * .26,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          border: Border.all(
                            color: Colors.white60,
                            width: 1.6,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7.0),
                          child: Image.network(
                            "https://www.shutterstock.com/image-vector/market-building-grocery-store-vector-600w-1624439218.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      title: const Text(
                        "Song Name Details",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Singer Name Details",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          Text(
                            "2 M reels",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MaterialButton(
                        color: AppColor.searchBarColor,
                        height: 30,
                        minWidth: w * 0.65,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        elevation: 3,
                        onPressed: () {},
                        child: const Text(
                          "Save Audio",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 7.0,
                  ),
                  Row(
                    children: [
                      ControlButtons(_player),
                      Container(
                        width: w * 0.73,
                        child: StreamBuilder<PositionData>(
                          stream: _positionDataStream,
                          builder: (context, snapshot) {
                            final positionData = snapshot.data;
                            return SeekBar(
                              duration: positionData?.duration ?? Duration.zero,
                              position: positionData?.position ?? Duration.zero,
                              bufferedPosition:
                                  positionData?.bufferedPosition ??
                                      Duration.zero,
                              onChangeEnd: _player.seek,
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      // const Text(
                      //   "2:36",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 15,
                      //       fontWeight: FontWeight.w400),
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 150,
                                childAspectRatio: 2 / 3.1,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: myProducts.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UseAudioScreen(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(7.0),
                                child: Image.network(myProducts[index],
                                    fit: BoxFit.fill),
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: w * 0.21,
            right: w * 0.21,
            child: MaterialButton(
              color: Colors.orange,
              height: 48,
              minWidth: 120,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 7,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UseAudioScreen(),
                  ),
                );
              },
              child: const Text(
                "Audios",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ControlButtons extends StatelessWidget {
  final AudioPlayer player;

  const ControlButtons(this.player, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: player.playerStateStream,
      builder: (context, snapshot) {
        final playerState = snapshot.data;
        final processingState = playerState?.processingState;
        final playing = playerState?.playing;
        if (processingState == ProcessingState.loading ||
            processingState == ProcessingState.buffering) {
          return Container(
            margin: EdgeInsets.all(4.0),
            width: 24.0,
            height: 14.0,
            child: const CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        } else if (playing != true) {
          return InkWell(
            onTap: player.play,
            child: const Icon(
              Icons.play_arrow,
              size: 35,
              color: Colors.orange,
            ),
          );
        } else if (processingState != ProcessingState.completed) {
          return InkWell(
            onTap: player.pause,
            child: const Icon(
              Icons.pause,
              size: 35,
              color: Colors.orange,
            ),
          );
        } else {
          return InkWell(
            onTap: () {
              player.seek(Duration.zero);
            },
            child: const Icon(
              Icons.replay,
              size: 35,
              color: Colors.orange,
            ),
          );
        }
      },
    );
  }
}
