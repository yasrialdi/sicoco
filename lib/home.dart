import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicoco/login.dart';
import 'package:sicoco/pertanyaandaftar.dart';
import 'package:http/http.dart' as http;

import 'admin/homeadmin.dart';
import 'api/Model_coaching.dart';
import 'api/Model_coaching2.dart';
import 'api/RepositoryCoaching.dart';
import 'daftarcoaching.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {


  List<DataCoaching> listCoaching = [];
  RepositoryGejala repository = RepositoryGejala();
  getDataGejala() async {
    listCoaching = await repository.getDataCoaching();
    setState(() {});
  }

  String username = "";

  Future getAkun() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString('username')!;
    });
  }

  Future<List> getDataa() async{
    String Url = 'https://dev-mykopay.payakumbuhkota.go.id/api/sicoco/getListCoaching';
    http.Response response = await http.get(Uri.parse(Url));
    return json.decode(response.body);

  }

  void main() async{
    List data = await getDataa();
    print(data);
  }


  // List data = await getDataa();
  // String MyData = data as String;

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('username');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                LoginPage()),
            (Route<dynamic> route) => false);
  }


  Widget _buildDrawer() {
    return SizedBox(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image(
                  image: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
              ),
              accountName: Text(""),
              accountEmail: Text(""),
              decoration: BoxDecoration(

              ),
            ),

            ListTile( leading: Icon(Icons.person_pin), title: Text("Profile"), onTap: (){},),
            ListTile( leading: Icon(Icons.list), title: Text("Coachingku"), onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => PageDaftarCoaching()));
            },),
            ListTile( leading: Icon(Icons.dangerous),title: Text("Logout"), onTap: (){
              logOut(context);
            },),
          ],
        ),
      ),
    );

  }


  @override
  void initState() {
    getAkun();
    getDataGejala();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Center(
              child: Text(
                'Selamat Datang, $username',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Ubuntu',
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Text(
                    'Silahkan pilih layanan coaching',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // color: Colors.white,
              ),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listCoaching.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(

                      margin: EdgeInsets.only(bottom: 3),
                      child: Card(
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: MaterialButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (_) => PagePertanyaanDaftar()));
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                  ),
                                  height: 15,
                                  minWidth: 30,
                                  child: Text(
                                    'Daftar',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Ubuntu',
                                        color: Colors.white),
                                  ),
                                  color: Color(0xff2484DF),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Pelatihan ${listCoaching[index].nm_materi}',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'Ubuntu',
                                          color: Colors.black,
                                        ),
                                      ),
                                      // ListView.builder(
                                      //   itemCount: listCoaching[i].jadwal.length,
                                      //   itemBuilder: (BuildContext ctx, int j) {
                                      //     return Text(listCoaching[i]
                                      //         .jadwal[j]
                                      //         .tempat); // display username as an example
                                      //   },
                                      // ),
                                      SizedBox(height: 18),
                                      Row(
                                        children: [
                                          Text(
                                            'Tanggal: ',
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
                                            'Pukul: ',
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
                                            'Tempat: ',
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
                                            'Kuota: ',
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontFamily: 'Ubuntu',
                                              color: Color(0xff928B8B),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 1),
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

      ),

      drawer: _buildDrawer(),
    );
  }

  // Future getData() async {
  //   try {
  //
  //     final response =
  //     await http.get(Uri.parse('https://dev-mykopay.payakumbuhkota.go.id/api/sicoco/getListCoaching'));
  //
  //
  //
  //     if (response.statusCode == 200) {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return Center(
  //               child: CircularProgressIndicator(),
  //             );
  //           });
  //       Navigator.of(context).pop();
  //
  //       final data = json.decode(response.body);
  //       setState(() {
  //         _post = data;
  //       });
  //     }
  //
  //
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}
