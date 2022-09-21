

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/resources/color_manager.dart';
import 'package:course_app/screens/courses/material.dart';
import 'package:course_app/screens/pay/pay_screen.dart';
import 'package:course_app/screens/pay/waiting%20screen.dart';
import 'package:course_app/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyCoursesScreen extends StatefulWidget {


  @override
  _PostsScreenState createState() => _PostsScreenState();
}

class _PostsScreenState extends State<MyCoursesScreen> {
  @override
  Widget build(BuildContext context) {

    final box = GetStorage();
    String e=box.read('email')??"x";
    
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
        toolbarHeight: 100,
          title: Text(
            "My Courses".tr,
            style: TextStyle(
                fontSize: 20,
                color: ColorManager.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),

        body: Container(
            color: Colors.white38,
            child: Column(children: [
              SizedBox(height: 30),
              Flexible(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('pay')
                          .where('studentemail', isEqualTo:e)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData)
                          return Center(child: Text('Loading'));
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return new Text('Loading...');
                          default:
                            return ListView.builder(
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot posts =
                                snapshot.data!.docs[index];
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 12),
                                  child: InkWell(
                                    onTap: () {

                                      Get.to(
                                          MaterialScreen(
                                            cat:posts['course'],
                                            doctor: posts['doctorname']
                                          )
                                      );

                                      // Get.to(MaterialScreen(
                                      //     doctor: posts["name"],
                                      //     cat: posts["course"]));
                                    },
                                    child:
                                    Container(
                                      height: 180,
                                      child:

                                      Stack(
                                        children: [
                                          Positioned(
                                              top: 30,
                                              child: Material(
                                                child: Container(
                                                  height: 180,
                                                  width: 350,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.grey
                                                              .withOpacity(0.3),
                                                          offset: Offset(
                                                              -10.0, 10.0),
                                                          blurRadius: 20,
                                                          spreadRadius: 4.0,
                                                        )
                                                      ]),
                                                ),
                                              )),

                                          Positioned(
                                            top: 10,
                                            left: 15,
                                            child: Card(
                                              elevation: 10,
                                              shadowColor:
                                              Colors.grey.withOpacity(0.5),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(15.0),
                                              ),
                                              child: Container(
                                                height: 120,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.0),
                                                    image: DecorationImage(
                                                        fit: BoxFit.fill,
                                                        image: NetworkImage(
                                                            posts['image']))),
                                              ),
                                            ),
                                          ),

                                          Positioned(
                                              top: 60,
                                              left: 170,
                                              child: Container(
                                                height: 150,
                                                width: 180,
                                                child: Column(children: [
                                                  Custom_Text(
                                                    text: posts['course'],
                                                    fontSize: 18,
                                                  ),
                                                  Divider(
                                                    color: Colors.black,
                                                  ),
                                                  Custom_Text(
                                                    text: posts['doctorname'],
                                                    fontSize: 18,
                                                    color:Colors.grey,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  // Custom_Text(
                                                  //   text:
                                                  //   posts["price"]??"" + " L.E",
                                                  //   fontSize: 15,
                                                  //   color: Colors.grey,
                                                  // ),
                                                ]),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              // separatorBuilder:
                              //     (BuildContext context, int index) => SizedBox(
                              //   height: 20,
                              // ),
                            );
                        }
                      }))
            ])));
  }
}
