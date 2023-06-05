import 'package:flutter/material.dart';
import 'package:papi_network/constants/app_colors.dart';
import 'package:papi_network/utils/extensions.dart';

class NewsScreen1 extends StatefulWidget {
  NewsScreen1({
    Key? key,
  }) : super(key: key);

  @override
  State<NewsScreen1> createState() => _NewsScreen1State();
}

class _NewsScreen1State extends State<NewsScreen1> {
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
          backgroundColor: AppColors.pinkPurpleAppBar,
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
              color: Colors.purple,
              child: Image.asset(
                'assets/images/NewsImage1.png',
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
                  child: Center(child: Text('PDF data')),
                ),
                15.sizeHeight,
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(child: Text('PDF data')),
                ),
                15.sizeHeight,
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(child: Text('PDF data')),
                ),
                15.sizeHeight,
                Container(
                  height: 400,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(child: Text('PDF data')),
                ),
                15.sizeHeight,
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(child: Text('PDF data')),
                ),
                15.sizeHeight,
                Container(
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey,
                  child: Center(child: Text('PDF data')),
                ),
                15.sizeHeight,
                Center(
                    child: InkWell(
                  borderRadius: BorderRadius.circular(22),
                  onTap: () {
                    setState(() {
                      changeLike = !changeLike;
                    });
                  },
                  child: Image.asset(
                    changeLike
                        ? 'assets/icons/likeFill.png'
                        : 'assets/icons/like.png',
                    height: 35,
                  ),
                )),
                5.sizeHeight,
                Center(child: Text('4.8K')),
                30.sizeHeight,
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
