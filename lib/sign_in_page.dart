import 'package:flutter/material.dart';
import 'package:flutter_test_1/controllers.dart';
import 'package:get/get.dart';

import 'sign_up_page.dart';

class LoginPageUI extends StatefulWidget {
  const LoginPageUI({Key? key}) : super(key: key);

  @override
  State<LoginPageUI> createState() => _LoginPageUIState();
}

class _LoginPageUIState extends State<LoginPageUI> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Log in",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log in with one of the following options.",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBF2F8),
                  //color: Colors.red,
                  //shape: BoxShape.rectangle : BoxShape.circle,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Center(
                    child: TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      Get.snackbar('Alert', 'Email is Empty');
                    }
                    return null;
                  },
                  style: const TextStyle(
                    color: Colors.black45,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0)),
                )),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBF2F8),
                  //color: Colors.red,
                  //shape: BoxShape.rectangle : BoxShape.circle,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Center(
                    child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      Get.snackbar('Alert', 'Password is Empty');
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscuringCharacter: "*",
                  obscureText: true,
                  style: const TextStyle(
                      letterSpacing: 1.5,
                      color: Colors.black45,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(16.0)),
                )),
              ),
              const SizedBox(
                height: 40,
              ),
              Obx(() => signSignUpController.isLoading.value
                  ? const CircularProgressIndicator(
                      color: Colors.purple,
                    )
                  : GestureDetector(
                      onTap: (() async {
                        
                        signSignUpController.isLoading.value = true;
                        await signSignUpController.login(
                            emailController.text, passwordController.text);
                        signSignUpController.isLoading.value = false;
                        
                      }),
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          //color: Colors.red,
                          //shape: BoxShape.rectangle : BoxShape.circle,
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                        ),
                        child: const Center(
                            child: Text(
                          "Log in",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        )),
                      ),
                    )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
