import 'package:flutter/material.dart';
import 'package:task2_depi/Colors/colors.dart';
import 'package:task2_depi/Screens/home_page_screen.dart';
import 'package:task2_depi/componants/decorated_card.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.bmi});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: appColors.backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Your Result',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: DecoratedCard(
                child: Column(
                  mainAxisAlignment: .spaceEvenly,
                  crossAxisAlignment: .center,
                  children: [
                    Text(
                      getClassification(bmi),
                      style: TextStyle(
                        color: getColor(bmi),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      bmi.toStringAsFixed(2),
                      style: TextStyle(fontSize: 56, color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        getDiscribtion(bmi),
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: appColors.activeColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text(
                'Recalculate',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String getClassification(double bmi) {
  if (bmi < 18.5) {
    return 'UnderWeight';
  } else if (bmi < 25) {
    return 'Healthy Weight';
  } else if (bmi < 30) {
    return 'OverWeight';
  } else {
    return 'Obesity';
  }
}

Color getColor(double bmi) {
  if (bmi < 18.5) {
    return Colors.grey;
  } else if (bmi < 25) {
    return Colors.green;
  } else if (bmi < 30) {
    return const Color.fromARGB(255, 244, 159, 48);
  } else {
    return Colors.red;
  }
}

String getDiscribtion(double bmi) {
  if (bmi < 18.5) {
    return 'you are as light as a feather 🪶 time to fuel your body 💪';
  } else if (bmi < 25) {
    return 'your body weight is absolutely normal good job 💪🔥';
  } else if (bmi < 30) {
    return 'you love food a little too much 🍔 time to get back on track 🏃‍♂️';
  } else {
    return 'you are the big fat panda 🐼 time to move and eat better 💪🔥';
  }
}
