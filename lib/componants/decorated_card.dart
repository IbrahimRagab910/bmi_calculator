import 'package:flutter/material.dart';
import 'package:task2_depi/Colors/colors.dart';

class DecoratedCard extends StatelessWidget {
  const DecoratedCard({super.key, required this.child, this.color});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:color?? appColors.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
