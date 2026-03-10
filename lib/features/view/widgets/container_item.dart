import 'package:flutter/material.dart';
import 'package:portfolio/core/res/app_colors.dart';

Container containerItem(BuildContext context,
    {required double height,
    required double width,

    required List<Widget> children}) {
  return Container(
    padding: const EdgeInsets.all(20),
   
    height: height,
    width: width,
    decoration: BoxDecoration(
      border: Border.all(
        color: borderColor,
        width: 1,
      ),
      color: cardColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    ),
  );
}
