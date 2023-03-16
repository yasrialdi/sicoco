import 'package:flutter/material.dart';

import 'RepositoryLogin.dart';

class PageDataAkun extends StatefulWidget {
  const PageDataAkun({Key? key}) : super(key: key);

  @override
  State<PageDataAkun> createState() => _PageDataAkunState();
}

class _PageDataAkunState extends State<PageDataAkun> {
  final formKey = GlobalKey<FormState>();

  bool isloading = false;
  bool _hide = true;
  bool _rehide = true;

  RepositoryLogin repository = RepositoryLogin();
  final _email = TextEditingController();
  final _nomorhp = TextEditingController();
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _konfirmasipassword = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Data Akun',
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
      body: Stack(
        // alignment: Alignment.bottomCenter,
        alignment: Alignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 100,),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Email',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'email Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _nomorhp,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Nomor HP',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'nomor hp Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _username,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Username',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'username Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _password,
                        obscureText: _hide,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Password',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color(0xffBFBFBF),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _hide ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _hide = !_hide;
                              });
                            },
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Password Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25,right: 25),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        controller: _konfirmasipassword,
                        obscureText: _hide,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: 'Konfirmasi Password',
                          hintStyle:
                          TextStyle(fontSize: 13, fontFamily: 'Ubuntu'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color(0xffBFBFBF),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.black.withOpacity(0.6),
                              width: 1,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _hide ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _hide = !_hide;
                              });
                            },
                          ),
                        ),
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Password Kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isloading = true;
                          });
                          await repository.postDataPengguna(
                              _email.text, _password.text);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          setState(() {
                            isloading = false;
                          });
                        }
                      },
                      color: Colors.blue,
                      height: 45,
                      minWidth: 360,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: (isloading)
                          ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ))
                          : const Text(
                        'SELESAI',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Ubuntu',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
