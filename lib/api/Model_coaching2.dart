import 'dart:convert';


class DataCoaching {

  final int id_materi;
  final String nm_materi;
  // final String pemateri;
  // final String buku_panduan;
  // final String link_video;
  // List<Jadwal> jadwal;

  DataCoaching({
    required this.id_materi,
    required this.nm_materi,
    // required this.pemateri,
    // required this.buku_panduan,
    // required this.link_video,
    // required this.jadwal,
  });

  factory DataCoaching.fromJson(Map<String, dynamic> json) {
    return DataCoaching(
      id_materi: json['id_materi'],
      nm_materi: json['nm_materi'],
      // pemateri: json['pemateri'],
      // buku_panduan: json['nm_materi'],
      // link_video: json['nm_materi'],
      // jadwal: (json['jadwal'] as List).map((e) => Jadwal.fromJson(e)).toList(),
    );
  }


}

class Jadwal {
  // final String tanggal;
  // final String waktu;
  // final String durasi;
  // final String jumlah_peserta;
  final String tempat;


  Jadwal({
    // required this.tanggal,
    // required this.waktu,
    // required this.durasi,
    // required this.jumlah_peserta,
    required this.tempat,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    return Jadwal(
      // tanggal: json['tanggal'],
      // waktu: json['waktu'],
      // durasi: json['durasi'],
      // jumlah_peserta: json['jumlah_peserta'],
      tempat: json['tempat'],

    );
  }

  // Map<String, dynamic> toJson() {
  //   return {
  //     // "tanggal": tanggal,
  //     // "waktu": waktu,
  //     // "durasi": durasi,
  //     // "jumlah_peserta": jumlah_peserta,
  //     "tempat": tempat,
  //   };
  // }
}

// List<Jadwal> gejalaFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<Jadwal>.from(data.map((item) => Jadwal.fromJson(item)));
// }
//
// String gejalaToJson(Jadwal data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }




// // List<DataCoaching> dataCoaching(String str) {
// //   final jsonData = json.decode(str);
// //   return new List<DataCoaching>.from(jsonData.map((x) => DataCoaching.fromJson(x)));
// // }
//
//
// class DataCoaching {
//   final int id_materi;
//   final String nm_materi;
//   // final String pemateri;
//   // final String buku_panduan;
//   // final String link_video;
//   // List<Jadwal> jadwal;
//
//   DataCoaching({
//     required this.id_materi,
//     required this.nm_materi,
//     // required this.pemateri,
//     // required this.buku_panduan,
//     // required this.link_video,
//     // required this.jadwal,
//   });
//
//   factory DataCoaching.fromJson(Map<String, dynamic> json) {
//
//     // var list = json['jadwal'] as List;
//     // print(list.runtimeType);
//     // List<Jadwal> jadwalList = list.map((i) => Jadwal.fromJson(i)).toList();
//
//     return DataCoaching(
//       id_materi: json['id_materi'],
//       nm_materi: json['nm_materi'],
//       // pemateri: json['pemateri'],
//       // buku_panduan: json['nm_materi'],
//       // link_video: json['nm_materi'],
//       // jadwal: json["jadwal"] = List<Jadwal>.from(json["jadwal"].map((x) => Jadwal.fromJson(x))),
//     );
//   }
// }
//
// class Jadwal {
//   final String tanggal;
//   final String waktu;
//   final String durasi;
//   final String jumlah_peserta;
//   final String tempat;
//
//   Jadwal({
//     required this.tanggal,
//     required this.waktu,
//     required this.durasi,
//     required this.jumlah_peserta,
//     required this.tempat,
//   });
//
//   factory Jadwal.fromJson(Map<String, dynamic> json) {
//     return Jadwal(
//       tanggal: json['tanggal'],
//       waktu: json['waktu'],
//       durasi: json['durasi'],
//       jumlah_peserta: json['jumlah_peserta'],
//       tempat: json['tempat'],
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
// // class DataCoaching {
// //   final int id_materi;
// //   final String nm_materi;
// //   final String pemateri;
// //   final String buku_panduan;
// //   final String link_video;
// //   List<Jadwal> jadwal;
// //
// //
// //   DataCoaching({
// //     required this.id_materi,
// //     required this.nm_materi,
// //     required this.pemateri,
// //     required this.buku_panduan,
// //     required this.link_video,
// //     required this.jadwal,
// //
// //
// //   });
// //
// //   factory DataCoaching.fromJson(Map<String, dynamic> json) {
// //     var list = json['jadwal'] as List;
// //     print(list.runtimeType);
// //     List<Jadwal> jadwalList = list.map((i) => DataCoaching.fromJson(i)).cast<Jadwal>().toList();
// //
// //     return DataCoaching(
// //       id_materi: json['id_materi'],
// //       nm_materi: json['nm_materi'],
// //       pemateri: json['pemateri'],
// //       buku_panduan: json['nm_materi'],
// //       link_video: json['nm_materi'],
// //       jadwal: jadwalList,
// //     );
// //   }
// // }
// //
// // class Jadwal {
// //   final String tanggal;
// //   final String waktu;
// //   final String durasi;
// //   final String jumlah_peserta;
// //   final String tempat;
// //
// //   Jadwal({
// //     required this.tanggal,
// //     required this.waktu,
// //     required this.durasi,
// //     required this.jumlah_peserta,
// //     required this.tempat,
// //   });
// //
// //   factory Jadwal.fromJson(Map<String, dynamic> json) {
// //     return Jadwal(
// //       tanggal: json['tanggal'],
// //       waktu: json['waktu'],
// //       durasi: json['durasi'],
// //       jumlah_peserta: json['jumlah_peserta'],
// //       tempat: json['tempat'],
// //     );
// //   }
// // }
//
//
//
