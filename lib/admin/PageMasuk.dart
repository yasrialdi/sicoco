import 'package:flutter/material.dart';
import 'package:sicoco/api/RepositoryCoaching.dart';
import 'package:sicoco/api/model_coaching_masuk.dart';

class PageMasuk extends StatefulWidget {
  const PageMasuk(TabController? tabcontroll, {Key? key}) : super(key: key);

  @override
  State<PageMasuk> createState() => _PageMasukState();
}

class _PageMasukState extends State<PageMasuk> {

  List<CoachingMasuk> listCoachingmasuk = [];

  RepositoryGejala repository = RepositoryGejala();
  getDataCoachingMasuk() async {
    listCoachingmasuk = await repository.getDataCoachingMasuk();
    setState(() {});
  }

  _showAlertDialogTerima(CoachingMasuk data ) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () async {
        await repository.prosesCoaching(
            data.idRegistrasi.toString(),
            "1",
        );
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cek Kembali"),
      content: Text(
          "Nama" ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
                return  x.status == 0 ? Container(
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
                                        onPressed: () async {
                                          _showAlertDialogTerima(listCoachingmasuk[i]);
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
                                        onPressed: () async {
                                          await repository.prosesCoaching(
                                              x.idRegistrasi.toString(),
                                              "2");
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
                )
                    : Text("");
              }),
        ),
      ),
    );
  }
}
