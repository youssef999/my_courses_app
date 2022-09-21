

import 'package:clipboard/clipboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/screens/home/widget/Bottom_bar.dart';
import 'package:course_app/widgets/custom_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/custom_text.dart';


  class VodafoneCash extends StatelessWidget {
  String
      email, course, price,doctorname,image;

  List coursex;

  VodafoneCash(
      {
        required this.email,
        required this.course,
        required this.price,
        required this.image,
        required this.doctorname,
        required this.coursex,

      });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool press = true;



  @override
  Widget build(BuildContext context) {
    TextEditingController  nameController=TextEditingController();
    //TextEditingController  moneyController=TextEditingController();
    TextEditingController  numController=TextEditingController();

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey,
          toolbarHeight: 1,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 44.0, right: 20.0, left: 20.0),
              child: Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    Text(
                      "Pay With vodafone cash".tr,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Reboto"),
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Total".tr + " = " + price,
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Reboto"),
                    ),

                    SizedBox(
                      height: 12
                    ),
                    Text(
                      "Send total to activate the course".tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Reboto"),
                    ),
                    SizedBox(
                      height: 12
                    ),



                    Text("Our Vodafone Cash Number".tr,
                      style:TextStyle(
                          color:Colors.grey,
                          fontSize:19,
                          fontWeight:FontWeight.w700
                      ),
                    ),

                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 20),
                        Text(
                          "01007484001",
                          style: TextStyle(color: Colors.grey, fontSize: 19),
                        ),
                        SizedBox(width: 20),
                        Spacer(),
                        InkWell(
                            child: Container(
                                height: 40,
                                width:90,
                                child: Image.asset('assets/images/copy.png')),
                            onTap: () {
                              FlutterClipboard.copy("01007484001")
                                  .then((value) => print('copied'));
                              Get.snackbar(
                                'Done',
                                ' Copied',
                                backgroundColor: Colors.lightGreen,
                                colorText: Colors.white,
                              );
                            })
                      ],
                    ),

                    SizedBox(height: 20),
                    TextFormField(
                      controller:nameController,

                        decoration: InputDecoration(
                          hintText:"Enter name".tr,
                          hintStyle: TextStyle(color:Colors.grey),
                          fillColor:Colors.white,
                        ),
                      onSaved:(value){
                        nameController!=value;
                      },
                    ),
                    SizedBox(height: 20),

                    SizedBox(width: 20),
                    TextFormField(
                      controller:numController,

                      decoration: InputDecoration(
                        hintText:"Wallet number".tr,
                        hintStyle: TextStyle(color:Colors.grey),
                        fillColor:Colors.white,
                      ),
                      onSaved:(value){
                        numController!=value;
                      },
                    ),


                    SizedBox(height: 20),

                    SizedBox(height: 20),


                    Text("Donot press the button until you send total to vodafone cash number".tr,
                    style:TextStyle(color:Colors.red,fontSize:15),
                    ),
                    SizedBox(height:30,),
                    Container(
                      width: 220,
                      child: RaisedButton(
                          color: Color.fromARGB(255, 116, 27, 27),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(5)),
                          child: Text(
                            "I Paid and want to activate the course".tr,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Reboto"),
                          ),
                          onPressed: () async {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {


                              coursex.add(doctorname);

                              await FirebaseFirestore.instance.collection('pay').add({
                                "course":course,
                                "studentname":nameController.text,
                                "doctorname":doctorname,
                                "studentemail":email,
                                "total":price,
                                "walletnumber":numController.text,
                                "courex":coursex.toString(),
                                "image":image.toString()

                              }).then((value) {

                            Get.snackbar("Done", "sent".tr,
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.lime,
                                duration: Duration(seconds: 3),
                                borderRadius: 10,
                                margin: EdgeInsets.all(10),
                                borderColor: Colors.yellow,
                                borderWidth: 2,
                                icon: Icon(Icons.add_task, color: Colors.white));

                            Get.off( BottomBar());



                          });

                          // final CollectionReference _updates =
                          //     FirebaseFirestore.instance.collection('user');
                          //
                          //     await _updates //.where('course',isEqualTo:'ahmed')
                          //         .where('email',isEqualTo:email)
                          //         .get().then((snapshot) {
                          //           coursex.add(doctorname);
                          //           print('vvv='+coursex.toString());
                          //       snapshot.docs.last.reference.update({
                          //         'pay':true,
                          //          'course':coursex,
                          //           //'price':price,
                          //       }).then((value) {
                          //         Get.off( BottomBar());
                          //
                          //       });
                          //    });

                            } else {
                              Get.snackbar("Error", "wrong information".tr,
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  borderRadius: 10,
                                  margin: EdgeInsets.all(10),
                                  borderColor: Colors.red,
                                  borderWidth: 2,
                                  icon: Icon(Icons.error, color: Colors.white));
                            }
                            //press=false;
                            // }
                          }),
                    ),
                    //    _listViewCodes(),
                    SizedBox(height: 15),
                    RaisedButton(
                        color:Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(5)),
                        child: Text(
                          "Chat Us".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Reboto"),
                        ),
                        onPressed: () async {

                            launcherWhatsapp('+201033487903', 'I am From App and want to contact');

                          // }
                        }),
                  ])),
            )));
  }
  void launcherWhatsapp(@required phone, @required msg) async {
    String url = 'whatsapp://send?phone=$phone&text=$msg';
    await canLaunch(url) ? launch(url) : launch(url);
  }
}
