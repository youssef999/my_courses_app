import 'package:course_app/Local/local_controller.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LanguageBody extends GetView<MyLocalController> {
  const LanguageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyLocalController controllerLang = Get.find();

    return Column(
      children: [
        SizedBox(height: 110),
        //ProfilePic(),
        ProfileMenu(
          icon: "assets/images/arabic.svg",
          text: "31".tr,
          press: () {
            controllerLang.changelang("ar");
            Get.off(BottomBar());
          },
        ),
        // ProfileMenu(
        //   icon: "assets/22.svg",
        //   text: "Language",
        //   press: () {},
        // ),
        ProfileMenu(
          icon: "assets/images/english-11.svg",
          text: "32".tr,
          press: () {
            controllerLang.changelang("en");
            Get.off(BottomBar());
          },
        ),
      ],
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
    Null Function()? onpress,
  }) : super(key: key);
  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
          padding: EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.black54,
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                color: Color.fromARGB(255, 10, 10, 10),
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              )),
              // Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
