part of 'supplychain_bloc.dart';

abstract class SupplychainEvent {}

class GetDataBeras extends SupplychainEvent {
  String? id;

  GetDataBeras({this.id});
}

class CreateAsset extends SupplychainEvent {
  String? id;
  String? namapetani;
  String? alamat;
  String? nohp;
  String? lamapanen;
  String? tanggalpanen;

  CreateAsset(
      {required this.id,
      required this.namapetani,
      required this.nohp,
      required this.lamapanen,
      required this.alamat,
      required this.tanggalpanen});
}

class TransferAssetToWholesaler extends SupplychainEvent {
  String? id;
  String? jumlah;

  TransferAssetToWholesaler({this.id, this.jumlah = ""});
}

class TransferAssetToDistributor extends SupplychainEvent {
  String? id;
  String? jumlah;
  String? lamapengeringan;
  String? lamapenyimpanan;
  String? kadarair;
  String? derajatsosoh;
  String? beraskepala;
  String? butirpatah;
  String? butirgabah;
  String? bendalain;

  TransferAssetToDistributor(
      {required this.id,
      required this.jumlah,
      required this.lamapengeringan,
      required this.lamapenyimpanan,
      required this.kadarair,
      required this.derajatsosoh,
      required this.beraskepala,
      required this.butirpatah,
      required this.bendalain,
      required this.butirgabah});
}

class LockAsset extends SupplychainEvent {
  String? id;

  LockAsset({this.id});
}

class ToInitial extends SupplychainEvent {}
