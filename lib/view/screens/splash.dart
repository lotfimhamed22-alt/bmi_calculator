import 'package:bmi_calculator/view/screens/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
 @override
  void initState() {
    // TODO: implement initState
   Future.delayed(Duration(seconds: 8),(){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Image.asset("assets/images/splash_bmi.png")
        ],),
      ),
    );
  }
}
