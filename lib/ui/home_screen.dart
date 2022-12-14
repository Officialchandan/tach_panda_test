import 'package:flutter/material.dart';
import 'package:tach_panda_test/ui/audio_screen.dart';

import 'constant/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController(text: "Food");

  List<Map<String, String>> contentList = [
    {"title": "Song Name", "subTitle": "singer name details"},
    {"title": "Song Name", "subTitle": "singer name details"},
    {"title": "Song Name", "subTitle": "singer name details"},
    {"title": "Song Name", "subTitle": "singer name details"},
    {"title": "Song Name", "subTitle": "singer name details"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.colorPrimary,
      body: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.colorPrimary,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
            ),
            centerTitle: true,
            title: Container(
              height: 53,
              child: SizedBox(
                child: TextFormField(
                  controller: searchController,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                    suffixIcon:
                        const Icon(Icons.search, size: 25, color: Colors.white),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.orange, width: 1.6),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.orange, width: 1.6),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.orange, width: 1.6),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
              ),
            ),
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.orange,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 18,
                color: Colors.white60,
              ),
              automaticIndicatorColorAdjustment: true,
              tabs: [
                Text(
                  "Trending",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Users",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Video",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Tag",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Audios",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              tileWidget(contentList: contentList),
              tileWidget(contentList: contentList),
              tileWidget(contentList: contentList),
              tileWidget(contentList: contentList),
              tileWidget(contentList: contentList),
            ],
          ),
        ),
      ),
    );
  }

  Widget tileWidget({required List<Map<String, String>> contentList}) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: contentList.length,
        itemBuilder: (BuildContext context, index) => InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AudioScreen(),
              ),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * .10,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColor.colorPrimary, //New
                  blurRadius: 10.0,
                  offset: const Offset(
                    5,
                    8,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Center(
              child: ListTile(
                leading: Container(
                  height: 170,
                  width: 70,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200, //New
                        blurRadius: 10.0,
                        offset: const Offset(
                          2,
                          5,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                  child: const CircleAvatar(
                    maxRadius: 160,
                    backgroundImage: NetworkImage(
                        "https://www.shutterstock.com/image-vector/market-building-grocery-store-vector-600w-1624439218.jpg"),
                  ),
                ),
                title: Text(
                  contentList[index]['title']!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  contentList[index]['subTitle']!,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
