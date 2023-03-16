import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login.dart';
import 'PageDiproses.dart';
import 'PageMasuk.dart';

class PageHomeAdmin extends StatefulWidget {
  const PageHomeAdmin({Key? key}) : super(key: key);

  @override
  State<PageHomeAdmin> createState() => _PageHomeAdminState();
}

class _PageHomeAdminState extends State<PageHomeAdmin> with SingleTickerProviderStateMixin{
  bool changed = true;
  TabController?tabcontroll;


  @override
  void initState() {
    tabcontroll = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabcontroll?.dispose();
    super.dispose();
  }

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


            ListTile( leading: Icon(Icons.dangerous),title: Text("Logout"), onTap: (){
              logOut(context);
            },),
          ],
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffDCE5F0),
        appBar: AppBar(
          title: Text(
            'DAFTAR COACHING',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: 'Ubuntu',
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Column(

          children: [

            TabBar(
              controller: tabcontroll,
              tabs: [
                Tab(
                  child: Text(
                    'MASUK',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'DIPROSES',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Ubuntu',
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: tabcontroll,
                  children: [
                    PageMasuk(tabcontroll),
                    PageDiproses(tabcontroll)
                  ],
                ),
              ),
            ),


            SizedBox(height: 10),

          ],
        ),
      drawer: _buildDrawer(),
    );
  }
}
