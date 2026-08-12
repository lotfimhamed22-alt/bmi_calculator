import 'package:bmi_calculator/constants/app_color.dart';
import 'package:bmi_calculator/view/screens/calculate_screen.dart';
import 'package:bmi_calculator/view/widgets/custom_text.dart';
import 'package:bmi_calculator/view_model/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 418,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 430,
              decoration: BoxDecoration(
                color: AppColors().primary,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 40, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text:
                          "Know Your Body Better , \nGet Your BMI Score in Less \nThan a Minute!",
                      size: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),

                    SizedBox(height: 15),
                    CustomText(
                      text:
                          "It takes just 30 seconds – and your health is \nworth it!",
                      size: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),

                    SizedBox(height: 35),

                    Divider(),
                    SizedBox(height: 22),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => BmiCubit(),
                              child: CalculateScreen(),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors().buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 140,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        "Get Start",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 32,
            top: 82,
            child: Image.asset(
              "assets/images/img_first_screen.png",
              width: 370,
            ),
          ),
        ],
      ),
    );
  }
}
