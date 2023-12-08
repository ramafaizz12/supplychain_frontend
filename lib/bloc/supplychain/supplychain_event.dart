part of 'supplychain_bloc.dart';

abstract class SupplychainEvent {}

class GetDataBeras extends SupplychainEvent {
  String? id;

  GetDataBeras({this.id});
}

class CreateAsset extends SupplychainEvent {
  String? id;
  String? jenisberas;
  String? namapetani;
  String? alamat;
  String? tanggalpanen;

  CreateAsset(
      {this.id,
      this.jenisberas,
      this.namapetani,
      this.alamat,
      this.tanggalpanen});
}

class TransferAsset extends SupplychainEvent {
  String? id;
  String? tanggaldiolah;
  String? alamatperusahaan;
  String? jumlah;

  TransferAsset(
      {this.id,
      this.tanggaldiolah = "",
      this.alamatperusahaan = "",
      this.jumlah = ""});
}

class LockAsset extends SupplychainEvent {
  String? id;

  LockAsset({this.id});
}
