import 'package:flutter/material.dart';

import 'daftarcoaching.dart';

class PagePertanyaanDaftar extends StatefulWidget {
  const PagePertanyaanDaftar({Key? key}) : super(key: key);

  @override
  State<PagePertanyaanDaftar> createState() => _PagePertanyaanDaftarState();
}

class _PagePertanyaanDaftarState extends State<PagePertanyaanDaftar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 350),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
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
                      SizedBox(height: 25,),
                      Text(
                        'Apakah anda yakin mendaftar\n'
                            'Pelatihan E-Kinerja',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu',
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(
                            width: 55,
                          ),
                          Column(children: [
                            FlatButton(
                              onPressed: () => {
                              Navigator.push(context, MaterialPageRoute(builder: (_) => PageDaftarCoaching()))
                              },
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.radio_button_checked, size: 35),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Ya',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          SizedBox(
                            width: 50,
                          ),
                          Column(children: [
                            FlatButton(
                              onPressed: () => {
                              Navigator.of(context).pop()
                              },
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.radio_button_checked, size: 35),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Tidak',
                                    style: TextStyle(
                                      fontSize: 10,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ],
                      ),
                      SizedBox(height: 38),
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
