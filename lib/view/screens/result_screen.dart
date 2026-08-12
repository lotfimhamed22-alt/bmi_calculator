import 'package:bmi_calculator/constants/app_color.dart';
import 'package:bmi_calculator/model/bmi_model.dart';
import 'package:bmi_calculator/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.name,
    required this.birth,
    required this.bmiModel,
  });
  final String name;
  final String birth;
  final BmiModel bmiModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: AppColors().primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 8.0,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: name,
                                  size: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: "A 19 years old male.",
                                  size: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  text: "16.5",
                                  size: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                CustomText(
                                  text: "BMI Calc",
                                  size: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: bmiModel.data.height,
                                      size: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    CustomText(
                                      text: "Height",
                                      size: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Container(
                                  height: 50,
                                  width: 1,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: bmiModel.data.weight,
                                      size: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                    CustomText(
                                      text: "Weight",
                                      size: 15,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Image.asset("assets/images/body.png", width: 83),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 23),
            Container(
              decoration: BoxDecoration(
                color: AppColors().cardColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15.0,
                  vertical: 13.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Under Weight",
                      size: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      text:
                          bmiModel.data.summary ??
                          "This weight is normal and you are healthy.",
                      size: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    SizedBox(height: 5),
                    CustomText(
                      text:
                          bmiModel.data.recommendation ??
                          "A BMI between 18.5 and 24.9 falls within the 'normal' weight range according\nto the World Health Organization. This range is associated with the lowest\nhealth risk for conditions such as heart disease, diabetes, and certain\ncancers. However, it's important to note that BMI is not a perfect measure\nas it does not account for muscle mass, bone density, overall body\ncomposition, and racial and sex differences. Therefore, while it's a useful\n starting point, it should not be the only measure of one's health.",
                      size: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 23),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors().buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.symmetric(horizontal: 90, vertical: 13),
              ),
              child: Text(
                "Calculate BMI Again",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
