import 'package:flutter/material.dart';

class CircleOwn extends StatelessWidget {
  final double radius;
  final List<Color> colors;

  const CircleOwn({Key key, @required this.radius, @required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(this.radius),
          gradient: LinearGradient(colors: this.colors,begin: Alignment.topRight,end: Alignment.bottomLeft)),
    );
  }
}
