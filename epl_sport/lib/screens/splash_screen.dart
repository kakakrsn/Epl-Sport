import 'package:epl_sport/screens/login/sign_up.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    var d = Duration(seconds: 8);
    Future.delayed(d, (){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) {
            return SignUp();
          },
        ),
        (route) => false);
    });

    super.initState();
  }

    List images = [
    'motion.gif',
    'epl-logo.png'
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/'+images[index]),
                fit: BoxFit.cover
              ),
              
            ),
          );
        },
      ),
    );
  }
}