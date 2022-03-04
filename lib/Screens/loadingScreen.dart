import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget{
  LoadingScreen({Key? key});
  @override
  State<LoadingScreen> createState() => LoadingScreenState();
}

class LoadingScreenState extends State<LoadingScreen> with SingleTickerProviderStateMixin{
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds:1), vsync: this,
    )..addListener(() {
      setState(() {});
    });
    controller.repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          value: controller.value,
          backgroundColor: Colors.green,
          semanticsLabel: 'Linear progress indicator',
        ),
      );

  }


}



