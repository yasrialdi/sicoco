import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  const PageDetail({Key? key}) : super(key: key);

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      appBar: AppBar(
        title: Text(
          'CoachingKu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 65),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 0,
                        blurRadius: 1.5,
                        offset: Offset(0, 0),
                      )
                    ],
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 38),
                      Text(
                        "Pelatihan E-Kinerja",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          children: [
                            Text(
                              'Tanggal : ',
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Ubuntu',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          children: [
                            Text(
                              'Pukul : ',
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Ubuntu',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Row(
                          children: [
                            Text(
                              'Tempat : ',
                              style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Ubuntu',
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50,)

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
