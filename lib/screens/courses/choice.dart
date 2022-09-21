import 'package:course_app/resources/assets_manager.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/courses/courses.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/levels.dart';

class ChoiceScreen extends StatelessWidget {
  final Levels levels;

  String level;

  ChoiceScreen({required this.level, required this.levels});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        toolbarHeight: 1,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Container(
                child: Stack(children: [
              Column(
                children: [
                  Container(
                    height: 270,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 8,
                          )
                        ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                      child: Image.asset(
                        levels.Image,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                  ),
                ],
              ),

            ])),
            SizedBox(
              height: 60,
            ),
            InkWell(
              child: Container(
                width: 330,
                height: 70,

                child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: ColorManager.kFontLight,
                    child: Custom_Text(
                      text: '18'.tr,
                      fontSize: 20,
                      color: ColorManager.black,
                      alignment: Alignment.center,
                    )),
              ),
              onTap: () {
                Get.to(CoursesViewScreen(
                  cat: 'ar',
                  level: level,
                ));
              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              child: Container(
                width: 330,
                height: 70,
                child: Card(
                    color: ColorManager.kFontLight,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Custom_Text(
                      text: '19'.tr,
                      fontSize: 20,
                      color: ColorManager.black,
                      alignment: Alignment.center,
                    )),
              ),
              onTap: () {
                Get.to(CoursesViewScreen(
                  cat: 'en',
                  level: level,
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
