import 'package:flutter/material.dart';
import 'package:papi_network/models/get_news_model.dart';
import 'package:papi_network/providers/auth_provider.dart';
import 'package:papi_network/ui/main_screens/home_page/news_screen1.dart';
import 'package:papi_network/widgets/bollet_title.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';

class HomePageNews extends StatefulWidget {
  const HomePageNews({Key? key}) : super(key: key);

  @override
  State<HomePageNews> createState() => _HomePageNewsState();
}

class _HomePageNewsState extends State<HomePageNews> {
  // List headings = [
  //   'New Headline 1',
  //   'New Headline 2',
  //   'New Headline 3',
  //   'New Headline 4',
  //   'New Headline 5',
  // ];

  // List dates = [
  //   '29 March 2023',
  //   '26 March 2023',
  //   '21 March 2023',
  //   '16 March 2023',
  //   '12 March 2023',
  // ];
  late var authData = Provider.of<AuthProvider>(context, listen: false);
  @override
  void initState() {
    late var authData = Provider.of<AuthProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18.0, top: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BulletTitle(title: 'News'),
              ],
            ),
            SizedBox(
              child: FutureBuilder<GetNEWSModel>(
                future: AuthProvider().getNewsFromAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 550,
                      child: ListView.builder(
                        itemCount: snapshot.data!.news!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsScreen1(
                                      //getNews: AuthProvider().getNewsFromAPI(),
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 11,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius:
                                            const BorderRadius.horizontal(
                                          left: Radius.circular(10),
                                          right: Radius.circular(10),
                                        )),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 75,
                                          width: 85,
                                          decoration: const BoxDecoration(
                                              color: AppColors.yellow,
                                              borderRadius:
                                                  BorderRadius.horizontal(
                                                      left:
                                                          Radius.circular(10))),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                  // decoration: BoxDecoration(
                                                  //     image: DecorationImage(
                                                  //         image:Image. ),),
                                                  ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: 70,
                                            width: 240,
                                            padding: const EdgeInsets.all(11),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data!.news!
                                                          .elementAt(index)
                                                          .title ??
                                                      "Loading...",

                                                  //  snapshot.data!.news!,
                                                  style: const TextStyle(
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      snapshot.data!.news!
                                                          .elementAt(index)
                                                          .date
                                                          .toString(),
                                                      style: const TextStyle(
                                                          fontSize: 8),
                                                    ),
                                                    const Spacer(),
                                                    const Icon(
                                                      Icons.favorite_border,
                                                      size: 12,
                                                    ),
                                                    Text(
                                                      snapshot.data!.news!
                                                          .elementAt(index)
                                                          .numberOfLike
                                                          .toString(),

                                                      // '6.4k',number_of_like
                                                      style: TextStyle(
                                                          fontSize: 8),
                                                    ),
                                                    const SizedBox(
                                                      width: 11,
                                                    ),
                                                    const Icon(
                                                      Icons.share_outlined,
                                                      size: 12,
                                                    ),
                                                    const SizedBox(
                                                      width: 11,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return CircularProgressIndicator(
                      color: AppColors.pinkPurpleAppBar,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
