import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../components/my_button.dart';
import '../../components/phone_textfield.dart';
import 'otp_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneNumber = TextEditingController();

  sendCode() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91" + phoneNumber.text,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error Occured', e.code);
        },
        codeSent: (String vid, int? token) {
          Get.to(
            OtpPage(
              vid: vid,
            ),
          );
        },
        codeAutoRetrievalTimeout: (vid) {},
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error Occured', e.code);
    } catch (e) {
      Get.snackbar("Error Occured", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Center(
            child: const Text(
              "Your Phone!",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 6),
            child: Text("Login by phone number!"),
          ),
          SizedBox(
            height: 20,
          ),
          PhoneTextField(
            controller: phoneNumber,
          ),
          SizedBox(
            height: 40,
          ),
          MyButton(
              buttonName: "Recieve OTP",
              onPressed: () {
                sendCode();
              }),
        ],
      ),
    );
  }
}
