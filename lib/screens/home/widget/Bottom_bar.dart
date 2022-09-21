import 'package:course_app/screens/courses/Course.dart';
import 'package:course_app/screens/home/widget/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../profile/profile_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int myIndex = 0;
  List<Widget> widgetList = [

    HomePage(),

    MyCoursesScreen(),

    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        toolbarHeight: 1,
      ),
      body: Center(
        child: widgetList[myIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          selectedItemColor: Color.fromARGB(255, 116, 27, 27),
          unselectedItemColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 187, 186, 186),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {

            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "26".tr),
            // BottomNavigationBarItem(
            //     icon: Icon(Icons.favorite_border_outlined), label: "27".tr),
            BottomNavigationBarItem(
                icon: Icon(Icons.school_outlined), label: "28".tr),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "29".tr),
          ]),
    );
  }
}
