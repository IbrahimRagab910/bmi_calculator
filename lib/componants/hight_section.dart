import 'package:flutter/material.dart';
import 'package:task2_depi/Colors/colors.dart';
import 'package:task2_depi/componants/decorated_card.dart';

class HightSection extends StatefulWidget {
  const HightSection({super.key});

  @override
  State<HightSection> createState() => _HightSectionState();
}

class _HightSectionState extends State<HightSection> {
  static double selectedValue = 120;
  @override
  Widget build(BuildContext context) {
    return DecoratedCard(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text('Hight', style: TextStyle(fontSize: 10, color: Colors.white)),
          Row(
            mainAxisAlignment: .center,
            children: [
              Text(
                selectedValue.toStringAsFixed(2),
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text('cm', style: TextStyle(fontSize: 8, color: Colors.white)),
            ],
          ),
          Slider(
            min: 80,
            max: 210,
            value: selectedValue,

            activeColor: appColors.activeColor,
            inactiveColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
