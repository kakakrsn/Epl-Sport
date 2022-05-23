import 'package:epl_sport/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late SharedPreferences logindata;

  String username = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      username = logindata.getString('username').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign In',
          style: GoogleFonts.poppins(color: Color(0xff8b8b8b8b), fontSize: 18),
        ),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              
              onPressed: () {
                Navigator.of(context).push(
                    // MaterialPageRoute(builder: (_) => DetailCLub(index: index))
                      PageRouteBuilder(pageBuilder:
                        (context, animation, secondaryAnimation) {
                          return MyHome();
                      },
                      transitionsBuilder: (context, animation,secondaryAnimation, child) {
                        final tween = Tween(
                          begin: const Offset(0, 5),
                          end: Offset.zero);
                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      }
                    )
                    );
              },
              child: Text(
                username,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.w500),
              )),
          ],
        ),
      ),
    );
  }
}
