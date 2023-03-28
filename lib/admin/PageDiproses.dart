import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sicoco/api/RepositoryCoaching.dart';
import 'package:sicoco/api/model_coaching_masuk.dart';

class PageDiproses extends StatefulWidget {
  const PageDiproses(TabController? tabcontroll, {Key? key}) : super(key: key);

  @override
  State<PageDiproses> createState() => _PageDiprosesState();
}

class _PageDiprosesState extends State<PageDiproses> {

  List<CoachingMasuk> listCoachingmasuk = [];

  RepositoryGejala repository = RepositoryGejala();
  getDataCoachingMasuk() async {
    listCoachingmasuk = await repository.getDataCoachingMasuk();
    setState(() {});
  }

  @override
  void initState() {
    getDataCoachingMasuk();
    super.initState();
  }

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
              itemCount: listCoachingmasuk.length,
              itemBuilder: (BuildContext context, i) {
                final x = listCoachingmasuk[i];
                return  x.status > 0 ? Container(
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
                                        'Nama     : ${x.pendaftar.nama}',
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
                                        'OPD        : ${x.pendaftar.opd}',
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
                                        'Tanggal  : ${x.jadwal.tanggal}',
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
                                        'Tempat   : ${x.jadwal.tempat}',
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
                                        'Pukul       : ${x.jadwal.waktu}',
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
                                        child: x.status == 1 ? Text(
                                          'Disetujui',
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Ubuntu',
                                              color: Colors.white),
                                        ) : Text(
                                          'Ditolak',
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
                ) : Text("");
              }),
        ),
      ),
    );
  }
}
