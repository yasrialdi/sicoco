import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicoco/admin/homeadmin.dart';

import 'package:sicoco/register.dart';
import 'package:sicoco/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  // late String username, password, id_user;

  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();

  bool _hide = true;

  final LogUrlXAMPP = 'https://dev-mykopay.payakumbuhkota.go.id/api/sicoco/login';

  doLogin(username, password) async {
    // final GlobalKey<State> _keyLoader = GlobalKey<State>();
    // Dialogs.loading(context, _keyLoader, "Proses ...");


    try {
      final response = await http.post(
          Uri.parse("https://dev-mykopay.payakumbuhkota.go.id/api/sicoco/login"),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "username": username,
            "password": password,
          }));

      final output = jsonDecode(response.body);

      // if (output.length < 1) {
      //   // if data user is empty or 0
      //   setState(() {
      //     Fluttertoast.showToast(
      //         msg: "Cek Kembali Akun Anda",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 3,
      //         backgroundColor: Colors.white,
      //         textColor: Colors.black,
      //         fontSize: 16);
      //   });
      // } else {
      //
      //   setState(() {
      //     username = output[0]["username"];
      //     password = output[0]["password"];
      //     // level = dataUser[0]["level"];
      //   });
      //
      //
      //   // move the page according to user status
      //
      //   // print(username);
      //   // print(password);
      //   if (username == "administrator") {
      //     // use navigator push replacement so that user can not go back to login page
      //     Fluttertoast.showToast(
      //         msg: "Login Berhasil Sebagai Admin",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 3,
      //         backgroundColor: Colors.white,
      //         textColor: Colors.black,
      //         fontSize: 16);
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => PageHomeAdmin()));
      //   } else {
      //     Fluttertoast.showToast(
      //         msg: "Login Berhasil Sebagai User",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 3,
      //         backgroundColor: Colors.white,
      //         textColor: Colors.black,
      //         fontSize: 16);
      //     Navigator.of(context).pushReplacement(
      //         MaterialPageRoute(builder: (context) => PageHome()));
      //   }
      // }


      if (output.length >= 1) {
        // Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //       content: Text(
        //         output['message'],
        //         style: const TextStyle(fontSize: 16),
        //       )),
        // );
        // Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => PageHome()));
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString('username', usernamectrl.text);

        if (username == "administrator") {
          // use navigator push replacement so that user can not go back to login page
          Fluttertoast.showToast(
              msg: "Login Berhasil Sebagai Admin",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PageHomeAdmin()));
        } else {
          Fluttertoast.showToast(
              msg: "Login Berhasil Sebagai User",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.white,
              textColor: Colors.black,
              fontSize: 16);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => PageHome()));
        }

      } else {
            Fluttertoast.showToast(
                msg: "Cek Kembali Akun Anda",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 3,
                backgroundColor: Colors.white,
                textColor: Colors.black,
                fontSize: 16);
      }
    } catch (e) {
      // Navigator.of(_keyLoader.currentContext!, rootNavigator: false).pop();
      // Dialogs.popUp(context, '$e');

    }
  }

  // Future loginProcess(username, password) async {
  //   if (formKey.currentState!.validate()) {
  //
  //     // final response = await http.post(Uri.parse(LogUrlXAMPP),
  //     //     body: {
  //     //   "username": usernamectrl.text,
  //     //       "password": passwordctrl.text});
  //
  //     final response = await http.post(
  //         Uri.parse("https://dev-mykopay.payakumbuhkota.go.id/api/sicoco/login"),
  //         headers: {'Content-Type': 'application/json; charset=UTF-8'},
  //         body: jsonEncode({
  //           "username": username,
  //           "password": password,
  //         }));
  //
  //     var dataUser = jsonDecode(response.body);
  //
  //     if (dataUser.length < 1) {
  //       // if data user is empty or 0
  //       setState(() {
  //         Fluttertoast.showToast(
  //             msg: "Cek Kembali Akun Anda",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.CENTER,
  //             timeInSecForIosWeb: 3,
  //             backgroundColor: Colors.white,
  //             textColor: Colors.black,
  //             fontSize: 16);
  //       });
  //     } else {
  //
  //       setState(() {
  //         username = dataUser[0]["username"];
  //         password = dataUser[0]["password"];
  //         // level = dataUser[0]["level"];
  //       });
  //
  //       SharedPreferences preferences = await SharedPreferences.getInstance();
  //       // preferences.setString('id_pengguna', id_pengguna.toString());
  //       preferences.setString('username', usernamectrl.text);
  //       // preferences.setString('level', level.toString());
  //
  //       // move the page according to user status
  //
  //       print(username);
  //       print(password);
  //       if (username == "administrator") {
  //         // use navigator push replacement so that user can not go back to login page
  //         Fluttertoast.showToast(
  //             msg: "Login Berhasil Sebagai Admin",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.CENTER,
  //             timeInSecForIosWeb: 3,
  //             backgroundColor: Colors.white,
  //             textColor: Colors.black,
  //             fontSize: 16);
  //         Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(builder: (context) => PageHomeAdmin()));
  //       } else {
  //         Fluttertoast.showToast(
  //             msg: "Login Berhasil Sebagai User",
  //             toastLength: Toast.LENGTH_SHORT,
  //             gravity: ToastGravity.CENTER,
  //             timeInSecForIosWeb: 3,
  //             backgroundColor: Colors.white,
  //             textColor: Colors.black,
  //             fontSize: 16);
  //         Navigator.of(context).pushReplacement(
  //             MaterialPageRoute(builder: (context) => PageHome()));
  //       }
  //     }
  //   }
  // }

  // void postLog() async{
  //   bool response = await login(
  //       usernamectrl.text,
  //       passwordctrl.text);
  // }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Login',
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
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150,),
                  Text(
                    'SICOCO',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Ubuntu',
                        color: Colors.black),
                  ),
                  SizedBox(height: 100),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: usernamectrl,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'username',
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
                          return 'Username Kosong';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: 400,
                    height: 45,
                    child: TextFormField(
                      controller: passwordctrl,
                      obscureText: _hide,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: 'password',
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
                  SizedBox(height: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Belum punya akun?',
                            style: TextStyle(
                              fontSize: 11,
                              fontFamily: 'Ubutu',
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              //Register
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PageRegister()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Ubuntu',
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            isLoading = true;
                          });
                          // Navigator.push(context, MaterialPageRoute(builder: (_) => PageHome()));
                          // await loginProcess(usernamectrl.text, passwordctrl.text);
                          doLogin(usernamectrl.text, passwordctrl.text);
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      color: Colors.blue,
                      height: 45,
                      minWidth: 360,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: (isLoading)
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1.5,
                              ))
                          : const Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Ubuntu',
                                  color: Colors.white),
                            ),
                    ),
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
