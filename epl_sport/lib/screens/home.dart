import 'package:flutter/material.dart';
import 'package:epl_sport/enum.dart';
import 'package:epl_sport/screens/club_detail.dart';
import 'package:epl_sport/screens/pemain.dart';
import 'package:epl_sport/view_models/club_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'login/profile/profile_screen.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
          future:
              Provider.of<ClubViewModel>(context, listen: false).getAllResult(),
          builder: (context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              final result = Provider.of<ClubViewModel>(context).response;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 60, left: 20),
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          size: 30,
                          color: Colors.black,
                        ),
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: CircleAvatar(
                            backgroundImage: AssetImage('assets/img/person.jpg'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Discover',
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'List Club',
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 120,
                    margin: const EdgeInsets.only(left: 20),
                    child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                children: [
                                  Container(
                                    // margin: const EdgeInsets.only(right: 20),
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${result[index].team!.logo}'), //${result[index].team!.logo}
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Container(
                                    child: Text('${result[index].team!.name}'),
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                  // MaterialPageRoute(builder: (_)=> DetailCLub(index: index))
                                  PageRouteBuilder(pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                return DetailCLub(index: index);
                              }, transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                final tween = Tween(
                                    begin: const Offset(0, 5),
                                    end: Offset.zero);
                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              }));
                            },
                          );
                        }),
                  ),
                  // SizedBox(height: 20,),
                  ListPemain(),
                ],
              );
            }
          }),
      bottomNavigationBar: CustomBottomNavbar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home_outlined,
                color: MenuState.home == selectedMenu
                    ? Color(0xFFFF7643)
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return MyHome();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween =
                      Tween(begin: const Offset(0, 5), end: Offset.zero);
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }));
              },
            ),
            IconButton(
              icon: Icon(
                Icons.person_outline_rounded,
                color: MenuState.profile == selectedMenu
                    ? inActiveIconColor
                    : Color(0xFFFF7643),
              ),
              onPressed: () {
                Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                  return ProfileScreen();
                }, transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                  final tween =
                      Tween(begin: const Offset(0, 5), end: Offset.zero);
                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                }));
              },
            ),
          ],
        ),
      ),
    );
  }
}
