import 'package:json_annotation/json_annotation.dart';
part 'DataBeras.g.dart';

@JsonSerializable()
class DataBeras {
  String? ID;
  String? nama_petani;
  String? benda_lain;
  String? beras_kepala;
  String? butir_gabah;
  String? butir_patah;
  String? derajat_sosoh;
  String? kadar_air;
  String? lama_panen;
  String? lama_pengeringan;
  String? lama_penyimpanan;
  String? owner;
  bool? konfirmasi_manufacturer;
  bool? konfirmasi_distributor;
  bool? konfirmasi_wholesaler;
  String? jumlahToWholesaler;
  String? tanggaldiolah;
  String? no_hp;
  String? alamat;
  String? tanggal_panen;

  String? timestamp;

  DataBeras({
    this.ID,
    this.nama_petani,
    this.benda_lain,
    this.beras_kepala,
    this.butir_gabah,
    this.butir_patah,
    this.derajat_sosoh,
    this.kadar_air,
    this.lama_panen,
    this.lama_pengeringan,
    this.lama_penyimpanan,
    this.owner,
    this.jumlahToWholesaler,
    this.tanggaldiolah,
    this.konfirmasi_manufacturer,
    this.konfirmasi_distributor,
    this.konfirmasi_wholesaler,
    this.alamat,
    this.tanggal_panen,
    this.no_hp,
    this.timestamp,
  });

  factory DataBeras.fromJson(Map<String, dynamic> data) =>
      _$DataBerasFromJson(data);

  Map<String, dynamic> toJson() => _$DataBerasToJson(this);
}
