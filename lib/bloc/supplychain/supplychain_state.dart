part of 'supplychain_bloc.dart';

abstract class SupplychainState {}

final class SupplychainInitial extends SupplychainState {}

class DataBerasLoaded extends SupplychainState {
  final DataBeras? data;

  DataBerasLoaded({this.data});
}

class DataBerasLoading extends SupplychainState {}

class DataBerasSukses extends SupplychainState {}

class DataBerasFailed extends SupplychainState {
  String? err;

  DataBerasFailed({this.err});
}
