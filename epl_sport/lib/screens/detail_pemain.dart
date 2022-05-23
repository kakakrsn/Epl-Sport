import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/statis.dart';


class DetailPemain extends StatefulWidget {
  final int index;

  const DetailPemain({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailPemain> createState() => _DetailPemainState();
}

class _DetailPemainState extends State<DetailPemain> {

  final List<Statistic> stats = [
    Statistic(14, 4, 3, 7, 0, 512, 11, 24, 1),
    Statistic(25, 14, 3, 8, 1, 1437, 5, 35, 9),
    Statistic(16, 3, 6, 7, 3, 235, 25, 4, 5),
    Statistic(0, 0, 0, 0, 0, 0, 0, 0, 0),
    Statistic(12, 9, 2, 1, 4, 171, 19, 4, 7),
    Statistic(13, 3, 3, 7, 0, 317, 3, 14, 2),
  ];

  @override
  Widget build(BuildContext context) {
    int index;

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
                      ]
                    ),
                    child: Image.asset('assets/img/data_dummy.jpg', fit: BoxFit.cover,),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Statistic',
                      style: GoogleFonts.poppins(
                            fontSize: 28, fontWeight: FontWeight.w500)
                    ),
                  ),
                  SizedBox(height: 12,),
                  Container(
                    height: 160,
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: Column(
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
                                    Image.asset('assets/img/played.png', fit: BoxFit.contain,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10,),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          
                                          Text('Play', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w900),),
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
                                    Image.asset('assets/img/trophy.png', fit: BoxFit.contain,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10,),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Goals', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w900),),
                                          Text('${stats[widget.index].win}', style: GoogleFonts.poppins(fontSize: 12),)
                                        ],
                                      ),  
                                    )
                                  ],
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                        SizedBox(height: 16,),
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
                                    Image.asset('assets/img/football.png', fit: BoxFit.contain,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Goals', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w900),),
                                          Text('${stats[widget.index].goal}', style: GoogleFonts.poppins(fontSize: 12),)
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
                                    Image.asset('assets/img/shoots.png', fit: BoxFit.contain,),
                                    Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text('Shots', style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w900),),
                                          Text('${stats[widget.index].shots}', style: GoogleFonts.poppins(fontSize: 12),)
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
                  SizedBox(height: 20,),
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