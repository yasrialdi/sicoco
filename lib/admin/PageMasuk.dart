import 'package:flutter/material.dart';

class PageMasuk extends StatefulWidget {
  const PageMasuk(TabController? tabcontroll, {Key? key}) : super(key: key);

  @override
  State<PageMasuk> createState() => _PageMasukState();
}

class _PageMasukState extends State<PageMasuk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDCE5F0),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            // color: Colors.white,
          ),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, index) {
                return  Container(
                  margin: EdgeInsets.only(bottom: 3),
                  child: Card(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Pelatihan E-Kinerja',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Ubuntu',
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 18),
                                  Row(
                                    children: [
                                      Text(
                                        'Nama : ',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff928B8B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    children: [
                                      Text(
                                        'OPD : ',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff928B8B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Tanggal : ',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff928B8B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Tempat : ',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff928B8B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Pukul : ',
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff928B8B),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
                                          // _showDialogBooking(listHome[index]);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        height: 15,
                                        minWidth: 30,
                                        child: Text(
                                          'Terima',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white),
                                        ),
                                        color: Color(0xff2484DF),
                                      ),
                                      SizedBox(width: 10),
                                      MaterialButton(
                                        onPressed: () {
                                          // edit(listHome[index]);
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                        ),
                                        height: 15,
                                        minWidth: 30,
                                        child: Text(
                                          'Tidak',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white),
                                        ),
                                        color: Color(0xff2484DF),
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
