import 'package:course_app/constants/colors.dart';
import 'package:course_app/models/home_view_model.dart';
import 'package:course_app/view_model/profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class EmojiText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => Container(
        padding: EdgeInsets.only(left: 25),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 22),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: controller.userModel?.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22, color: kFont)),
              TextSpan(text: "")
            ]),
          ),
        ),
      ),
    );
  }
}
