import 'package:flutter/material.dart';
import 'package:task2_depi/componants/decorated_card.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap, required this.color,
  });
  final String text;
  final Icon icon;
  final Function() onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedCard(
        color: color,
        child: Column(
          mainAxisAlignment: .center,
          children: [
            icon,
            Text(text, style: TextStyle(fontSize: 10, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
