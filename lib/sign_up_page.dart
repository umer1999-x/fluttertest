import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Sign up",
          style: TextStyle(
              color: Colors.black, fontSize: 28, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign up with one of the following options.",
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
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
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBF2F8),
                  //color: Colors.red,
                  //shape: BoxShape.rectangle : BoxShape.circle,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Center(
                    child: TextFormField(
                  controller: nameController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 3) {
                      Get.snackbar(
                          'Alert', 'Name is Empty or Character lenght less 3');
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
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
                height: 60,
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
                    if (value!.isEmpty || !value.contains('@')) {
                      Get.snackbar(
                          'Alert', 'email is Empty or Enter a valid email');
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
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
                height: 60,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color(0xFFEBF2F8),
                  //color: Colors.red,
                  //shape: BoxShape.rectangle : BoxShape.circle,
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                ),
                child: Center(
                    child: TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 6) {
                      Get.snackbar('Alert',
                          'password is empty or password lenght is less the 6');
                    }
                    return null;
                  },
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
              Obx(
                () => signSignUpController.isLoading.value
                    ? const CircularProgressIndicator(
                      color: Colors.purple,
                    )
                    : GestureDetector(
                        onTap: () async {
                          signSignUpController.isLoading.value = true;
                          await signSignUpController.signUp(nameController.text,
                              emailController.text, passwordController.text);
                          signSignUpController.isLoading.value = false;
                        },
                        child: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color:  Colors.purple,
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0)),
                          ),
                          child: const Center(
                              child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          )),
                        ),
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Log in",
                    style: TextStyle(
                        color:  Colors.purple,
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
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
