import 'package:json_annotation/json_annotation.dart';
part 'DataBeras.g.dart';

@JsonSerializable()
class DataBeras {
  String? ID;
  String? jenisberas;
  String? namapetani;
  String? alamatpetani;
  String? tanggalpanen;
  bool? konfirmasi_manufacturer;
  bool? konfirmasi_distributor;
  bool? konfirmasi_wholesaler;
  String? jumlahToWholesaler;
  String? tanggaldiolah;
  String? no_hp;
  String? alamatperusahaan;
  String? jumlahToRetailer;
  String? timestamp;

  DataBeras(
      {this.ID,
      this.jenisberas,
      this.namapetani,
      this.alamatpetani,
      this.tanggalpanen,
      this.konfirmasi_manufacturer,
      this.konfirmasi_distributor,
      this.konfirmasi_wholesaler,
      this.alamatperusahaan,
      this.tanggaldiolah,
      this.no_hp,
      this.jumlahToRetailer,
      this.timestamp,
      this.jumlahToWholesaler});

  factory DataBeras.fromJson(Map<String, dynamic> data) =>
      _$DataBerasFromJson(data);

  Map<String, dynamic> toJson() => _$DataBerasToJson(this);
}
