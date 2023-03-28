import 'package:intl/intl.dart';

class CoachingMasuk {
  CoachingMasuk({
    required this.idRegistrasi,
    required this.nmMateri,
    required this.pemateri,
    required this.bukuPanduan,
    required this.linkVideo,
    required this.status,
    required this.jadwal,
    required this.pendaftar,
  });

  final int idRegistrasi;
  final String nmMateri;
  final String pemateri;
  final String bukuPanduan;
  final String linkVideo;
  final int status;
  final Jadwal jadwal;
  final Pendaftar pendaftar;

  factory CoachingMasuk.fromJson(Map<String, dynamic> json) => CoachingMasuk(
    idRegistrasi: json["id_registrasi"],
    nmMateri: json["nm_materi"],
    pemateri: json["pemateri"],
    bukuPanduan: json["buku_panduan"],
    linkVideo: json["link_video"],
    status: json["status"],
    jadwal: Jadwal.fromJson(json["jadwal"]),
    pendaftar: Pendaftar.fromJson(json["pendaftar"]),
  );
}

class Jadwal {
  Jadwal({
    required this.tanggal,
    required this.waktu,
    required this.durasi,
    required this.jumlahPeserta,
    required this.tempat,
  });

  final String tanggal;
  final String waktu;
  final int durasi;
  final int jumlahPeserta;
  final String tempat;

  factory Jadwal.fromJson(Map<String, dynamic> json){
    DateTime parsedTanggal = DateTime.parse(json['tanggal']);
    return Jadwal(
        tanggal: json["tanggal"]!= null
            ? DateFormat('d MMMM y').format(parsedTanggal): "",
        waktu: json["waktu"],
        durasi: json["durasi"],
        jumlahPeserta: json["jumlah_peserta"],
        tempat: json["tempat"]
    );
  }
}

class Pendaftar {
  Pendaftar({
    required this.nama,
    required this.opd,
    required this.jabatan,
  });

  final String nama;
  final String opd;
  final String jabatan;

  factory Pendaftar.fromJson(Map<String, dynamic> json) => Pendaftar(
    nama: json["nama"],
    opd: json["opd"],
    jabatan: json["jabatan"],
  );
}