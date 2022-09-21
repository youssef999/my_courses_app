import 'package:course_app/auth/Sign_up.dart';
import 'package:course_app/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  String ? log;

  LoginScreen({this.log});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        toolbarHeight: 1,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Image.asset(
                        "assets/images/life course.jpg",
                        width: 220,
                        height: 220,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // SizedBox(
                    //   height: 15,
                    // ),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          "2".tr,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w900),
                        )),
                    SizedBox(
                      height: 25,
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            )
                          ]),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        onSaved: (value) {
                          controller.email = value!;
                        },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "3".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(height: 1)),
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 7,
                            )
                          ]),
                      child: TextFormField(
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        onSaved: (value) {

                          controller.password = value!;

                          },
                        validator: (value) {
                          if (value == null) {
                            print("Error");
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "4".tr,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                            hintStyle: TextStyle(height: 1)),
                      ),
                    ),

                    // SizedBox(
                    //   height: 7,
                    // ),
                    // Row(
                    //   children: [
                    //     Spacer(),
                    //     GestureDetector(
                    //       onTap: () {
                    //         Get.to(ForgetPasswordScreen());
                    //       },
                    //       child: Text("Forget password",
                    //           style: TextStyle(
                    //             decoration: TextDecoration.underline,
                    //             fontSize: 15,
                    //             fontWeight: FontWeight.w400,
                    //           )),
                    //     )
                    //   ],
                    // ),
                    SizedBox(
                      height: 50,
                    ),

                    InkWell(
                      onTap: () {
                        _formKey.currentState!.save();
                        if (_formKey.currentState!.validate()) {
                          controller.signInWithEmailAndPassword();
                        }
                      },


                      child: Container(
                        alignment: Alignment.center,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 187, 186, 186),
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ]),
                        child: Text(
                          "5".tr,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ),
                    ),

                    // SizedBox(
                    //   height: 25,
                    // ),
                    // SocialMedia(),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "35".tr,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        InkWell(
                            onTap: () {
                              Get.to(SignUpScreen());
                            },
                            child: Text(
                              "36".tr,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 187, 186, 186),
                                  fontSize: 16),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
