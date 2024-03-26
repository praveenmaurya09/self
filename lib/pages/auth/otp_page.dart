import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

import 'package:self/wrapper.dart';

import '../../components/my_button.dart';

class OtpPage extends StatefulWidget {
  final String vid;

  const OtpPage({super.key, required this.vid});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  var code = '';

  signIn() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.vid,
      smsCode: code,
    );

    try {
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Get.offAll(Wrapper()));
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error Occured", e.code);
    } catch (e) {
      Get.snackbar("Error Occured", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
              child: const Text(
                "OTP Verification",
                style: TextStyle(fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: Text(
                "Enter OTP sent to +91 8849125974",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            textCode(),
            SizedBox(
              height: 80,
            ),
            MyButton(
              buttonName: "Verify & Proceed",
              onPressed: () {
                signIn();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget textCode() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Pinput(
          length: 6,
          onChanged: (value) {
            setState(() {
              code = value;
            });
          },
        ),
      ),
    );
  }
}
