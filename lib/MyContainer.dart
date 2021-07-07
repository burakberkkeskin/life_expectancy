import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color newColor;
  final Widget? child;

  MyContainer({this.newColor = Colors.white, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.child,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: newColor),
    );
  }
}
