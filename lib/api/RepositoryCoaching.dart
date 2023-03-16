import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:sicoco/api/Model_coaching.dart';

import 'Model_coaching2.dart';


class RepositoryGejala {
  final baseUrl = 'https://dev-mykopay.payakumbuhkota.go.id/api/sicoco/getListCoaching';
  final baseUrll = 'http://192.168.172.187/proyekakhir/get_data_gejala.php';
  final UrlDeleteGejala = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/delete_gejala.php';
  final UrlUpdateGejala = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/update_gejala.php';
  final UrlTambahGejala = 'https://ibuhamil.hidra-lab.my.id/proyekakhir/tambah_data_gejala.php';

  Future getDataCoaching() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        // print(response.body);
        Iterable it = jsonDecode(response.body);
        List<DataCoaching> dataCoaching = it.map((e) => DataCoaching.fromJson(e)).toList();
        return dataCoaching;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // Future getDataCoachingJadwal() async {
  //   try {
  //     final response = await http.get(Uri.parse(baseUrl));
  //
  //     if (response.statusCode == 200) {
  //       print(response.body);
  //       Iterable it = jsonDecode(response.body)['jadwal'];
  //       List<DataCoaching> dataCoaching = it.map((e) => DataCoaching.fromJson(e)).toList();
  //       return dataCoaching;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  Future<bool> deletegejala(String id) async {
    try {
      final response = await http
          .post(Uri.parse(UrlDeleteGejala), body: {'id_gejala': id});

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      log(e.toString(), name: 'deletegejala');
    }
    return false;
  }

  Future<bool> updateGejala(
      String id ,String kode, String namagjl, String nilaicf, String deskripsi) async {
    try {
      final response = await http
          .post(Uri.parse(UrlUpdateGejala), body: {
        "id_gejala": id,
        "kode_gejala": kode,
        "nama_gejala": namagjl,
        "nilai_cf": nilaicf,
        "deskripsi_gejala": deskripsi,
      });

      if (response.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Update Data Gejala Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Update Data Gejala Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
    } catch (e) {
      log(e.toString());
    }
    return false;
  }

  Future postDataTambahGejala(
      String kode, String namagjl, String deskripsi, String nilaicf) async {
    try {
      final response = await http.post(Uri.parse(UrlTambahGejala), body: {

        "kode_gejala": kode,
        "nama_gejala": namagjl,
        "deskripsi_gejala": deskripsi,
        "nilai_cf": nilaicf,

      });

      if (response != '0') {
        Fluttertoast.showToast(
            msg: "Tambah Data Gejala Berhasil",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      } else {
        Fluttertoast.showToast(
            msg: "Tambah Data Gejala Gagal",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.white,
            textColor: Colors.black,
            fontSize: 16
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
