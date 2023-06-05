import 'package:flutter/material.dart';
import 'package:papi_network/utils/extensions.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool changeLike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: MyAppBar.appBar(context,
      //     txt: 'Team',
      //     backGroundColor: AppColors.pinkPurpleAppBar,
      //     textAndIconsColor: Colors.white, onPressed: () {
      //   // Navigator.pop(context);
      // }),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.pink,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.ios_share_rounded),
            ),
          ],
          expandedHeight: 300,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/frame.png',
                width: double.infinity,
                height: 220,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.sizeHeight,
                Text(
                  '“Hello, Papiliever”',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                15.sizeHeight,
                Text(
                  'April 13,2023',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                15.sizeHeight,
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(child: Text('data')),
                ),
                135.sizeHeight,
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(child: Text('data')),
                ),
                300.sizeHeight,
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
