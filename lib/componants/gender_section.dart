import 'package:flutter/material.dart';
import 'package:task2_depi/Colors/colors.dart';
import 'package:task2_depi/componants/gender_card.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});


  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GenderCard(
            color: isMale ? appColors.activeColor : appColors.primaryColor,
            onTap: () {
              setState(() {
                isMale = true;
              });
            },
            icon: Icon(Icons.male, size: 60, color: Colors.white),
            text: 'Male',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: GenderCard(
            color: isMale ? appColors.primaryColor : appColors.activeColor,
            onTap: () {
              setState(() {
                isMale = false;
              });
            },
            icon: Icon(Icons.female, size: 60, color: Colors.white),
            text: 'Female',
          ),
        ),
      ],
    );
  }
}
