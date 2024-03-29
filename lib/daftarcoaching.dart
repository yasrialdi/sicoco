import 'package:flutter/material.dart';
import 'package:sicoco/detailcoaching.dart';

import 'api/Model_CoachingKu.dart';
import 'api/RepositoryCoaching.dart';

class PageDaftarCoaching extends StatefulWidget {
  const PageDaftarCoaching({Key? key}) : super(key: key);

  @override
  State<PageDaftarCoaching> createState() => _PageDaftarCoachingState();
}

class _PageDaftarCoachingState extends State<PageDaftarCoaching> {

  List<CoachingKu> listCoachingKu = [];

  RepositoryGejala repository = RepositoryGejala();
  getDataCoachingKu() async {
    listCoachingKu = await repository.getDataCoachingKu();
    setState(() {});
  }

  @override
  void initState() {
    getDataCoachingKu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  // color: Colors.white,
                ),
                child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: listCoachingKu.length,
                    itemBuilder: (BuildContext context, i) {
                      final x = listCoachingKu[i];
                      return Container(

                        margin: EdgeInsets.only(bottom: 3),
                        child: Card(
                          color: Color(0xffDCE5F0),

                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                          x.nmMateri,
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
                                              'Tanggal  : ${x.jadwal.tanggal}',
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
                                              'Pukul      f: ${x.jadwal.waktu}',
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
                                              'Tempat   : ${x.jadwal.tempat}',
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
                                                // Navigator.push(context, MaterialPageRoute(builder: (_) => PagePertanyaanDaftar()));
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              height: 15,
                                              minWidth: 30,
                                              child: Text(
                                                'Batalkan',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Ubuntu',
                                                    color: Colors.white),
                                              ),
                                              color: Color(0xff2484DF),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 1),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            MaterialButton(
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (_) => PageDetail()));
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                              ),
                                              height: 15,
                                              minWidth: 30,
                                              child: Text(
                                                'Detail',
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Ubuntu',
                                                    color: Colors.white),
                                              ),
                                              color: Color(0xff2484DF),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      );
                    }),
              ),
            ],
          ),
        )
    );
  }
}
