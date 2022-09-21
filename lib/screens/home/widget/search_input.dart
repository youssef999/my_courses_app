import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/constants/colors.dart';
import 'package:course_app/screens/home/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SearchInput extends StatefulWidget {
  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: kFontLight, width: 2)),
            child: TextField(
              cursorColor: kFontLight,
              decoration: InputDecoration(
                //fillColor: kFont.withOpacity(0.1),
                filled: true,
                // contentPadding: EdgeInsets.all(18),
                border: InputBorder.none,
                hintText: "11".tr,
                hintStyle: TextStyle(color: kFontLight),
              ),
            ),
          ),
          Positioned(
            right: 45,
            top: 35,
            child: InkWell(
              child: Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color:  Color.fromARGB(255, 21, 20, 20).withOpacity(0.9),

                ),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                ),
                width: 30,
              ),
              onTap: () {
                Get.to(SearchScreen(
                  text: searchController.text,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
