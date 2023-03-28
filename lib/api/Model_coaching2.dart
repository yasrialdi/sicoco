import 'package:intl/intl.dart';

class DataCoaching {
  final int idMateri;
  final String nmMateri;
  // final String pemateri;
  // final String bukuPanduan;
  // final String linkVideo;
  final Jadwal jadwal;

  DataCoaching({
    required this.idMateri,
    required this.nmMateri,
    // required this.pemateri,
    // required this.bukuPanduan,
    // required this.linkVideo,
    required this.jadwal,
  });

  factory DataCoaching.fromJson(Map<String, dynamic> json){
    return DataCoaching(
      idMateri: json["id_materi"],
      nmMateri: json["nm_materi"],
      // pemateri: json["pemateri"],
      // bukuPanduan: json["buku_panduan"],
      // linkVideo: json["link_video"],
      jadwal: Jadwal.fromJson(json["jadwal"]),
    );
  }
}

class Jadwal {
  final String tanggal;
  final String waktu;
  // final String durasi;
  final int jumlahPeserta;
  final String tempat;

  Jadwal({
    required this.tanggal,
    required this.waktu,
    // required this.durasi,
    required this.jumlahPeserta,
    required this.tempat,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json) {
    DateTime parsedTanggal = DateTime.parse(json['tanggal']);
    // DateTime parsedWaktu = DateTime.parse(json['waktu']);

    return Jadwal(
      tanggal: json["tanggal"]
        != null
          ? DateFormat('d MMMM y').format(parsedTanggal)
          : "",
      waktu: json["waktu"],
        // != null
        //   ? DateFormat('EEEE, d MMMM y HH:mm').format(parsedWaktu)
        //   : "",
      // durasi: json["durasi"],
      jumlahPeserta: json["jumlah_peserta"],
      tempat: json["tempat"],
    );
  }
}
