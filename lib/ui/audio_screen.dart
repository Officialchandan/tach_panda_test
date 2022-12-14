import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:tach_panda_test/ui/use_audio_screen.dart';

import 'constant/colors.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final progress = Duration(milliseconds: 100);
  final buffered = Duration(milliseconds: 100);
  final total = Duration(milliseconds: 100);

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
                      const Icon(
                        Icons.play_arrow,
                        color: Colors.orange,
                        size: 32,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: ProgressBar(
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
                      ),
                      const SizedBox(width: 10.0),
                      const Text(
                        "2:36",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
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

class DurationState {
  const DurationState(
      {required this.progress, required this.buffered, required this.total});
  final Duration progress;
  final Duration buffered;
  final Duration total;
}
