import 'package:flutter/material.dart';
import 'package:papi_network/utils/extensions.dart';

import '../../constants/app_colors.dart';
import '../../widgets/my_app_bar.dart';

class LanguagesScreen extends StatefulWidget {
  const LanguagesScreen({Key? key}) : super(key: key);

  @override
  State<LanguagesScreen> createState() => _LanguagesScreenState();
}

class _LanguagesScreenState extends State<LanguagesScreen> {
  bool bool1 = false;
  bool bool2 = false;
  bool bool3 = false;
  bool bool4 = false;
  bool bool5 = false;
  bool bool6 = false;
  bool bool7 = false;
  bool bool8 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar.appBar(context,
          txt: 'Languages',
          backGroundColor: AppColors.pinkPurpleAppBar,
          textAndIconsColor: Colors.white, onPressed: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.all(23.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Default Language',
                style: TextStyle(
                    color: AppColors.purpleTextColor,
                    fontWeight: FontWeight.bold),
              ),
              simpleSingleTitlesWidget(title: 'English', onTap: () {}),
              33.sizeHeight,
              Text(
                'Change Language',
                style: TextStyle(
                    color: AppColors.purpleTextColor,
                    fontWeight: FontWeight.bold),
              ),

              // English
              bool1
                  ? singleTitlesWidget(
                      title: 'English',
                      onTap: () {
                        setState(() {
                          bool1 = false;
                          bool2 = bool3 =
                              bool4 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'English',
                      onTap: () {
                        setState(() {
                          bool1 = true;
                          bool2 = bool3 =
                              bool4 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      }),
              // Urdu
              bool2
                  ? singleTitlesWidget(
                      title: 'Urdu',
                      onTap: () {
                        setState(() {
                          bool2 = false;
                          bool1 = bool3 =
                              bool4 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'Urdu',
                      onTap: () {
                        setState(() {
                          bool2 = true;
                          bool1 = bool3 =
                              bool4 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      }),

              // Punjabi
              bool3
                  ? singleTitlesWidget(
                      title: 'Punjabi',
                      onTap: () {
                        setState(() {
                          bool3 = false;
                          bool1 = bool2 =
                              bool4 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'Punjabi',
                      onTap: () {
                        setState(() {
                          bool3 = true;
                          bool1 = bool2 =
                              bool4 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      }),

              // Pushtu
              bool4
                  ? singleTitlesWidget(
                      title: 'Pushtu',
                      onTap: () {
                        setState(() {
                          bool4 = false;
                          bool1 = bool3 =
                              bool2 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'Pushtu',
                      onTap: () {
                        setState(() {
                          bool4 = true;
                          bool1 = bool3 =
                              bool2 = bool5 = bool6 = bool7 = bool8 = false;
                        });
                      }),

              // Siraiki
              bool5
                  ? singleTitlesWidget(
                      title: 'Siraiki',
                      onTap: () {
                        setState(() {
                          bool5 = false;
                          bool1 = bool3 =
                              bool4 = bool2 = bool6 = bool7 = bool8 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'Siraiki',
                      onTap: () {
                        setState(() {
                          bool5 = true;
                          bool1 = bool3 =
                              bool4 = bool2 = bool6 = bool7 = bool8 = false;
                        });
                      }),

              // Tughlu
              bool6
                  ? singleTitlesWidget(
                      title: 'Tughlu',
                      onTap: () {
                        setState(() {
                          bool6 = false;
                          bool1 = bool3 =
                              bool4 = bool5 = bool2 = bool7 = bool8 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'Tughlu',
                      onTap: () {
                        setState(() {
                          bool6 = true;
                          bool1 = bool3 =
                              bool4 = bool5 = bool2 = bool7 = bool8 = false;
                        });
                      }),

              // Chinese
              bool7
                  ? singleTitlesWidget(
                      title: 'Chinese',
                      onTap: () {
                        setState(() {
                          bool7 = false;
                          bool1 = bool3 =
                              bool4 = bool5 = bool6 = bool2 = bool8 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'Chinese',
                      onTap: () {
                        setState(() {
                          bool7 = true;
                          bool1 = bool3 =
                              bool4 = bool5 = bool6 = bool2 = bool8 = false;
                        });
                      }),

              // Hindi
              bool8
                  ? singleTitlesWidget(
                      title: 'Hindi',
                      onTap: () {
                        setState(() {
                          bool8 = false;
                          bool1 = bool3 =
                              bool4 = bool5 = bool6 = bool7 = bool2 = false;
                        });
                      })
                  : simpleSingleTitlesWidget(
                      title: 'Hindi',
                      onTap: () {
                        setState(() {
                          bool8 = true;
                          bool1 = bool3 =
                              bool4 = bool5 = bool6 = bool7 = bool2 = false;
                        });
                      }),
            ],
          ),
        ),
      ),
    );
  }

  ///***********************  Single Titles Widget **********************
  Widget singleTitlesWidget({
    required String? title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColors.pink, AppColors.blue]),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }

  ///***********************  Single Titles Widget **********************
  Widget simpleSingleTitlesWidget({
    required String? title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 40,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 35),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title!,
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
