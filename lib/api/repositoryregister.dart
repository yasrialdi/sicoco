import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class RepositoryLogin {
  final ReqUrlXAMPP = 'https://dev-mykopay.payakumbuhkota.go.id/api/sicoco/register';

  Future postDataPengguna(
      String nama,
      String email,
      String username,
      String password,
      String password_confirmation,
      String nip,
      String jabatan,
      String jenis_kelamin,
      String tempat_lahir,
      String no_hp,
      ) async {
    try {
      final response = await http.post(Uri.parse(ReqUrlXAMPP),
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "nama" : nama,
            "email" : email,
            "username" : username,
            "password" : password,
            "password_confirmation" : password_confirmation,
            "nip" : nip,
            "jabatan" : jabatan,
            "jenis_kelamin" : jenis_kelamin,
            "tempat_lahir" : tempat_lahir,
            "no_hp": no_hp,


          }));

      // if (response != '0') {
      //   Fluttertoast.showToast(
      //       msg: "Register Berhasil",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 3,
      //       backgroundColor: Colors.white,
      //       textColor: Colors.black,
      //       fontSize: 16
      //   );
      // } else {
      //   Fluttertoast.showToast(
      //       msg: "Skrining Gagal",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 3,
      //       backgroundColor: Colors.white,
      //       textColor: Colors.black,
      //       fontSize: 16
      //   );
      // }
      return json.decode(response.body);
    } catch (e) {
      print(e.toString());
    }
  }



}
