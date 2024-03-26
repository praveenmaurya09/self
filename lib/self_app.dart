import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:self/wrapper.dart';

class SelfApp extends StatelessWidget {
  const SelfApp({super.key,});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MySelf',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Wrapper(),
    );
  }
}
