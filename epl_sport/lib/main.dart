import 'package:epl_sport/screens/splash_screen.dart';
import 'package:epl_sport/view_models/club_view_model.dart';
import 'package:epl_sport/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ClubViewModel>(
          create: (context) =>ClubViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel())
      ],
      child: MaterialApp(
            title: 'Flutter Demo',
            home:  SplashScreen(),
            
            debugShowCheckedModeBanner: false,
          ),
      
    );
  }
}
