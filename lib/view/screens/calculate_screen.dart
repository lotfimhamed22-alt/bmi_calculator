// ignore_for_file: deprecated_member_use

import 'package:bmi_calculator/constants/app_color.dart';
import 'package:bmi_calculator/model/bmi_model.dart';
import 'package:bmi_calculator/view/screens/result_screen.dart';
import 'package:bmi_calculator/view/widgets/custom_row.dart';
import 'package:bmi_calculator/view/widgets/custom_text.dart';
import 'package:bmi_calculator/view/widgets/custom_text_form_field.dart';
import 'package:bmi_calculator/view_model/bmi_view_model.dart';

import 'package:flutter/material.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({super.key});

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerBirthDate = TextEditingController();

  final TextEditingController controllerHeight = TextEditingController();
  final TextEditingController controllerWidth = TextEditingController();
  bool isSelected = false;
  final _formKey = GlobalKey<FormState>();
  BmiViewModel repo = BmiViewModel();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  // text
                  CustomText(
                    text: "bmi".toUpperCase(),
                    size: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors().cardColor,
                  ),
                  //SizedBox(height: 5),
                  CustomRow(text: "Name"),
                  SizedBox(height: 12),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      } else if (value.length < 3) {
                        return 'Name must be at least 3 characters';
                      }
                      return null;
                    },
                    null,
                    null,
                    controller: controllerName,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 20),
                  CustomRow(text: "Birth Date"),
                  SizedBox(height: 12),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your birth date";
                      }
                      return null;
                    },
                    null,
                    null,
                    controller: controllerBirthDate,
                    textAlign: TextAlign.start,
                    onTap: () async {
                      var birthDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (birthDate != null) {
                        controllerBirthDate.text = birthDate.toString();
                      }
                    },
                  ),
                  SizedBox(height: 20),
                  CustomRow(text: "Choose Gender"),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = true;
                              });
                            },
                            child: Container(
                              width: 111.30,
                              height: 100,
                              padding: EdgeInsets.only(
                                top: 7,
                                left: 7,
                                right: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                                border: isSelected == true
                                    ? Border.all(color: Colors.red, width: 2)
                                    : Border(),
                              ),
                              child: Image.asset("assets/images/male.png"),
                            ),
                          ),
                          SizedBox(height: 12),
                          CustomRow(text: "Male"),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = false;
                              });
                            },
                            child: Container(
                              width: 111.30,
                              height: 100,
                              padding: EdgeInsets.only(
                                top: 7,
                                left: 7,
                                right: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                                border: isSelected != true
                                    ? Border.all(color: Colors.red, width: 2)
                                    : Border(),
                              ),
                              child: Image.asset("assets/images/female.png"),
                            ),
                          ),
                          SizedBox(height: 12),
                          CustomRow(text: "Female"),
                        ],
                      ),
                      // Column(children: []),
                    ],
                  ),
                  SizedBox(height: 22),
                  CustomRow(text: "Your Height(cm)"),
                  SizedBox(height: 12),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your height';
                      }

                      final height = double.tryParse(value);
                      if (height == null) {
                        return 'Height must be a number';
                      }

                      if (height < 50 || height > 250) {
                        return 'Height should be between 50 and 250 cm';
                      }

                      return null;
                    },
                    textAlign: TextAlign.center,
                    GestureDetector(
                      onTap: () {
                        if (controllerHeight.text.isEmpty) {
                          return;
                        }
                        var height = double.parse(controllerHeight.text);
                        setState(() {
                          height--;
                        });
                        controllerHeight.text = height.toString();
                      },
                      child: Icon(Icons.remove),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controllerHeight.text.isEmpty) {
                          return;
                        }
                        var height = double.parse(controllerHeight.text);

                        setState(() {
                          height++;
                        });
                        controllerHeight.text = height.toString();
                      },
                      child: Icon(Icons.add),
                    ),
                    controller: controllerHeight,
                  ),
                  SizedBox(height: 12),
                  CustomRow(text: "Your Weight(kg)"),
                  SizedBox(height: 12),
                  CustomTextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your weight';
                      }
                      final weight = double.tryParse(value);
                      if (weight == null) {
                        return 'Weight must be a number';
                      }
                      if (weight < 10 || weight > 300) {
                        return 'Weight should be between 10 and 300 kg';
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                    GestureDetector(
                      onTap: () {
                        if (controllerWidth.text.isEmpty) {
                          return;
                        }
                        var weight = double.parse(controllerWidth.text);
                        setState(() {
                          weight--;
                        });
                        controllerWidth.text = weight.toString();
                      },
                      child: Icon(Icons.remove),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controllerWidth.text.isEmpty) {
                          return;
                        }
                        var weight = double.parse(controllerWidth.text);
                        setState(() {
                          weight++;
                        });
                        controllerWidth.text = weight.toString();
                      },
                      child: Icon(Icons.add),
                    ),
                    controller: controllerWidth,
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> res = await repo.calculationBmi(
                          controllerWidth.text,
                          controllerHeight.text,
                        );

                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ResultScreen(
                              name: controllerName.text,
                              birth: controllerBirthDate.text,
                              bmiModel: BmiModel.fromJson(res),
                            ),
                          ),
                        );
                      }

                      return;
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors().buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 120,
                        vertical: 13,
                      ),
                    ),
                    child: Text(
                      "Calculate BMI",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
