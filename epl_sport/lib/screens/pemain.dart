import 'package:epl_sport/screens/detail_pemain.dart';
import 'package:epl_sport/view_models/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:epl_sport/models/bola_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/statis.dart';

class ListPemain extends StatefulWidget {
  const ListPemain({Key? key}) : super(key: key);

  @override
  State<ListPemain> createState() => _ListPemainState();
}

class _ListPemainState extends State<ListPemain> {
  final List<Statistic> stats = [
    Statistic(38, 21, 11, 6, 73, 20998, 526, 551, 13),
    Statistic(38, 12, 9, 17, 46, 13116, 397, 512, 7),
    Statistic(38, 5, 13, 20, 27, 17796, 442, 601, 9),
    Statistic(38, 12, 9, 17, 36, 17522, 463, 588, 10),
    Statistic(38, 20, 9, 9, 68, 24292, 608, 526, 12),
    Statistic(38, 12, 7, 19, 48, 17690, 424, 727, 9),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: FutureBuilder<void>(
            future: Provider.of<HomeViewModel>(context, listen: false)
                .getAllResult(),
            builder: (context, AsyncSnapshot<void> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final result = Provider.of<HomeViewModel>(context).response;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'List Player',
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
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '${result[index].player!.photo}'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Container(
                                      child:
                                          Text('${result[index].player!.name}'),
                                    ),
                                    
                                  ],
                                ),
                              ),
                              onTap: () {
                              Navigator.of(context).push(
                                  // MaterialPageRoute(builder: (_)=> DetailCLub(index: index))
                                  PageRouteBuilder(pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                      return DetailPemain(index: index);
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

                            );
                          }),
                    )
                  ],
                );
              }
            }));
  }
}
