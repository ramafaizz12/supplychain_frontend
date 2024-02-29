// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DataBeras.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataBeras _$DataBerasFromJson(Map<String, dynamic> json) => DataBeras(
      ID: json['ID'] as String?,
      jenisberas: json['jenisberas'] as String?,
      namapetani: json['namapetani'] as String?,
      alamatpetani: json['alamatpetani'] as String?,
      tanggalpanen: json['tanggalpanen'] as String?,
      konfirmasi_manufacturer: json['konfirmasi_manufacturer'] as bool?,
      konfirmasi_distributor: json['konfirmasi_distributor'] as bool?,
      konfirmasi_wholesaler: json['konfirmasi_wholesaler'] as bool?,
      alamatperusahaan: json['alamatperusahaan'] as String?,
      tanggaldiolah: json['tanggaldiolah'] as String?,
      no_hp: json['no_hp'] as String?,
      jumlahToRetailer: json['jumlahToRetailer'] as String?,
      timestamp: json['timestamp'] as String?,
      jumlahToWholesaler: json['jumlahToWholesaler'] as String?,
    );

Map<String, dynamic> _$DataBerasToJson(DataBeras instance) => <String, dynamic>{
      'ID': instance.ID,
      'jenisberas': instance.jenisberas,
      'namapetani': instance.namapetani,
      'alamatpetani': instance.alamatpetani,
      'tanggalpanen': instance.tanggalpanen,
      'konfirmasi_manufacturer': instance.konfirmasi_manufacturer,
      'konfirmasi_distributor': instance.konfirmasi_distributor,
      'konfirmasi_wholesaler': instance.konfirmasi_wholesaler,
      'jumlahToWholesaler': instance.jumlahToWholesaler,
      'tanggaldiolah': instance.tanggaldiolah,
      'no_hp': instance.no_hp,
      'alamatperusahaan': instance.alamatperusahaan,
      'jumlahToRetailer': instance.jumlahToRetailer,
      'timestamp': instance.timestamp,
    };
