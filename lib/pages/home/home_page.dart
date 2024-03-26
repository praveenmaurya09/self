import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:self/components/weeknumber_widget.dart';


class HomePage extends StatelessWidget {

  HomePage({super.key,});

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();

    final user = FirebaseAuth.instance.currentUser;

    signOut() async {
      await FirebaseAuth.instance.signOut();
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50),
        child: Column(
          children: [
            WeekNumberWidget(),
            SizedBox(height: 10,),
            Divider(thickness: 2,),
            Center(
              child: Text(
                "${user!.phoneNumber}",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() => signOut()),
        child: Icon(Icons.login_rounded),
      ),
    );
  }
}
