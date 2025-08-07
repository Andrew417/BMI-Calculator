import 'package:bmi_calculator/pages/bmi_calculator_screen.dart';
import 'package:bmi_calculator/utils/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});
  final double result;

  String getCategory() {
    if (result < 18.5) {
      return 'Underweight';
    } else if (result < 25) {
      return 'NORMAL';
    } else if (result < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }

  Color getCategoryColor() {
    if (result < 18.5) {
      return Colors.red;
    } else if (result < 25) {
      return Colors.green;
    } else if (result < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String motivationMessage() {
    if (getCategory() == 'Underweight') {
      return "Your body weight is underweight. You should gain some weight.";
    } else if (getCategory() == "NORMAL") {
      return 'Your body weight is normal. Good job!';
    } else if (getCategory() == "Overweight") {
      return 'Your body weight is overweight. You should lose some weight.';
    } else {
      return 'Your body weight is obese. You should lose a lot of weight.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Text(
              'Your result',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 60),
            Expanded(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.cardColor,
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 110),
                    child: Column(
                      children: [
                        Text(
                          getCategory(),
                          style: TextStyle(
                            color: getCategoryColor(),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(
                          "${result.toStringAsFixed(1)}",
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 80,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    motivationMessage(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => const BmiCalculatorScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Recalculate',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
