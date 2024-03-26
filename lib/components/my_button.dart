import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonName;
  final Function()? onPressed;

  MyButton({super.key, required this.buttonName, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: Text(
            buttonName,
            style: const TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[300],
          padding: const EdgeInsets.all(16.0),
        ),
      ),
    );
  }
}
