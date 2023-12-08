// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataBeras.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBeras _$DataBerasFromJson(Map<String, dynamic> json) => DataBeras(
      id: json['ID'] as String?,
      jenisberas: json['jenis_beras'] as String?,
      namapetani: json['nama_petani'] as String?,
      alamatpetani: json['alamat'] as String?,
      tanggalpanen: json['tanggal_panen'] as String?,
      konfirmasimanufacturer: json['konfirmasi_manufacturer'] as bool?,
      konfirmasidistributor: json['konfirmasi_distributor'] as bool?,
      konfirmasiretailer: json['konfirmasi_retailer'] as bool?,
      konfirmasiwholesaler: json['konfirmasi_wholesaler'] as bool?,
      alamatperusahaan: json['alamat_perusahaan'] as String?,
      tanggaldiolah: json['tanggal_diolah'] as String?,
      timestamp: json['timestamp'] as String?,
      jumlah: json['jumlah'] as String?,
    );

Map<String, dynamic> _$DataBerasToJson(DataBeras instance) => <String, dynamic>{
      'id': instance.id,
      'jenisberas': instance.jenisberas,
      'namapetani': instance.namapetani,
      'alamatpetani': instance.alamatpetani,
      'tanggalpanen': instance.tanggalpanen,
      'konfirmasimanufacturer': instance.konfirmasimanufacturer,
      'konfirmasidistributor': instance.konfirmasidistributor,
      'konfirmasiwholesaler': instance.konfirmasiwholesaler,
      'konfirmasiretailer': instance.konfirmasiretailer,
      'tanggaldiolah': instance.tanggaldiolah,
      'alamatperusahaan': instance.alamatperusahaan,
      'jumlah': instance.jumlah,
      'timestamp': instance.timestamp,
    };
