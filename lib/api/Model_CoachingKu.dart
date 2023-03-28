import 'package:intl/intl.dart';

class CoachingKu {
  final int idRegistrasi;
  final int idMateri;
  final String nmMateri;
  final String pemateri;
  final String bukuPanduan;
  final String linkVideo;
  final int status;
  final Jadwal jadwal;

  CoachingKu({
    required this.idRegistrasi,
    required this.idMateri,
    required this.nmMateri,
    required this.pemateri,
    required this.bukuPanduan,
    required this.linkVideo,
    required this.status,
    required this.jadwal,
  });

  factory CoachingKu.fromJson(Map<String, dynamic> json) => CoachingKu(
    idRegistrasi: json["id_registrasi"],
    idMateri: json["id_materi"],
    nmMateri: json["nm_materi"],
    pemateri: json["pemateri"],
    bukuPanduan: json["buku_panduan"],
    linkVideo: json["link_video"],
    status: json["status"],
    jadwal: Jadwal.fromJson(json["jadwal"]),
  );

}

class Jadwal {
  final String tanggal;
  final String waktu;
  // final int durasi;
  // final int jumlahPeserta;
  final String tempat;

  Jadwal({
    required this.tanggal,
    required this.waktu,
    // required this.durasi,
    // required this.jumlahPeserta,
    required this.tempat,
  });

  factory Jadwal.fromJson(Map<String, dynamic> json){
    DateTime parsedTanggal = DateTime.parse(json['tanggal']);
    return Jadwal(
        tanggal: json["tanggal"]!= null
        ? DateFormat('EEEE, d MMMM y').format(parsedTanggal): "",
    waktu: json["waktu"],
    // durasi: json["durasi"],
    // jumlahPeserta: json["jumlah_peserta"],
    tempat: json["tempat"],
    );
  }
}
