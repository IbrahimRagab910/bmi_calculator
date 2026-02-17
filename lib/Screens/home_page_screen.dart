import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:task2_depi/Colors/colors.dart';
import 'package:task2_depi/Screens/resultScreen.dart';
import 'package:task2_depi/componants/decorated_card.dart';
import 'package:task2_depi/componants/gender_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double hight = 80;
  bool isMale = true;
  int weight = 20;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: appColors.backgroundColor,
        title: Text(
          'Bmindex',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(child: _GenderSection()),
            SizedBox(height: 10),
            Expanded(child: _HightSection()),
            SizedBox(height: 10),
            Expanded(child: _counterSection()),
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: appColors.activeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                double bmi = ((weight / ((hight / 100) * (hight / 100))));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(bmi: bmi),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _counterSection() {
    return Row(
      children: [
        Expanded(
          child: DecoratedCard(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  'weight',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                Text(
                  '$weight',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: () {
                        if (weight > 0) {
                          setState(() {
                            weight--;
                          });
                        }
                      },
                      icon: Icon(Icons.remove, color: Colors.white, size: 16),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          weight++;
                        });
                      },
                      icon: Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: DecoratedCard(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Text(
                  'Age',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
                Text(
                  '$age',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    IconButton(
                      style: IconButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: () {
                        if (age > 0) {
                          setState(() {
                            age--;
                          });
                        }
                      },
                      icon: Icon(Icons.remove, color: Colors.white, size: 16),
                    ),
                    IconButton(
                      style: IconButton.styleFrom(backgroundColor: Colors.grey),
                      onPressed: () {
                        setState(() {
                          age++;
                        });
                      },
                      icon: Icon(Icons.add, color: Colors.white, size: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row _GenderSection() {
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

  DecoratedCard _HightSection() {
    return DecoratedCard(
      child: Column(
        mainAxisAlignment: .center,
        children: [
          Text('Hight', style: TextStyle(fontSize: 10, color: Colors.white)),
          Row(
            mainAxisAlignment: .center,
            children: [
              Text(
                '${hight.toInt()}',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              Text('cm', style: TextStyle(fontSize: 8, color: Colors.white)),
            ],
          ),
          Slider(
            min: 80,
            max: 210,
            value: hight,

            activeColor: appColors.activeColor,
            inactiveColor: Colors.grey,
            onChanged: (value) {
              setState(() {
                hight = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
