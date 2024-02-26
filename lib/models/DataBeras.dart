import 'package:json_annotation/json_annotation.dart';
part 'DataBeras.g.dart';

@JsonSerializable()
class DataBeras {
  String? id;
  String? jenisberas;
  String? namapetani;
  String? alamatpetani;
  String? tanggalpanen;
  bool? konfirmasimanufacturer;
  bool? konfirmasidistributor;
  bool? konfirmasiwholesaler;
  bool? konfirmasiretailer;
  String? jumlahToWholesaler;
  String? tanggaldiolah;
  String? No_hp;
  String? Npwp;
  String? alamatperusahaan;
  String? jumlahToRetailer;
  String? timestamp;

  DataBeras(
      {this.id,
      this.jenisberas,
      this.namapetani,
      this.alamatpetani,
      this.tanggalpanen,
      this.konfirmasimanufacturer,
      this.konfirmasidistributor,
      this.konfirmasiretailer,
      this.konfirmasiwholesaler,
      this.alamatperusahaan,
      this.tanggaldiolah,
      this.No_hp,
      this.Npwp,
      this.jumlahToRetailer,
      this.timestamp,
      this.jumlahToWholesaler});

  factory DataBeras.fromJson(Map<String, dynamic> data) =>
      _$DataBerasFromJson(data);

  Map<String, dynamic> toJson() => _$DataBerasToJson(this);
}
