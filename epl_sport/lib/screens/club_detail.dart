import 'package:flutter/material.dart';
import 'package:epl_sport/models/statis.dart';
import 'package:epl_sport/view_models/home_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DetailCLub extends StatefulWidget {
  final int index;

  const DetailCLub({Key? key, required this.index}) : super(key: key);
  // final PemainDetail pemainDetail;

  // DetailCLub({required this.pemainDetail});

  @override
  State<DetailCLub> createState() => _DetailCLubState();
}

class _DetailCLubState extends State<DetailCLub> {
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
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              // margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 2.0),
                            blurRadius: 6.0,
                          )
                        ]),
                    child: Image.asset(
                      'assets/img/data_dummy.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text('Statistic',
                        style: GoogleFonts.poppins(
                            fontSize: 28, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 160,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: ListView(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 68,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/img/played.png',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Played',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text('${stats[widget.index].play}')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 68,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/img/trophy.png',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Win',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            '${stats[widget.index].win}',
                                            style: GoogleFonts.poppins(fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 68,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/img/football.png',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'Goals',
                                            style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            '${stats[widget.index].goal}',
                                            style: GoogleFonts.poppins(fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 8),
                                padding: EdgeInsets.only(left: 16),
                                height: 68,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/img/goalkeeper.png',
                                      fit: BoxFit.contain,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'CleanSheet',
                                            style: GoogleFonts.poppins(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          Text(
                                            '${stats[widget.index].cleanSheet}',
                                            style: GoogleFonts.poppins(fontSize: 12),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 160,
                  //   child: Image.asset('assets/img/data_dummy.jpg'),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
