import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        child: Column(
          children: [
            SingleChildScrollView(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter text...',
                  hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey, // Customize hint text color
                  ),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0), // Adjust vertical padding
                  border: InputBorder.none, // Disable border
                ),
                maxLines: null, // Allow multiple lines
              ),
            ),
            SizedBox(height: 16.0),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintText: 'Enter text...',
            //         hintStyle: TextStyle(
            //           fontSize: 16.0,
            //           color: Colors.grey, // Customize hint text color
            //         ),
            //         contentPadding:
            //         EdgeInsets.symmetric(vertical: 10.0), // Adjust vertical padding
            //         border: InputBorder.none, // Disable border
            //       ),
            //       maxLines: null, // Allow multiple lines
            //     ),
            //   ),
            // ),
            // SizedBox(height: 16.0),
            // Expanded(
            //   child: SingleChildScrollView(
            //     child: TextField(
            //       decoration: InputDecoration(
            //         hintText: 'Enter text...',
            //         hintStyle: TextStyle(
            //           fontSize: 16.0,
            //           color: Colors.grey, // Customize hint text color
            //         ),
            //         contentPadding:
            //         EdgeInsets.symmetric(vertical: 10.0), // Adjust vertical padding
            //         border: InputBorder.none, // Disable border
            //       ),
            //       maxLines: null, // Allow multiple lines
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
