import 'package:json_annotation/json_annotation.dart';
part 'data_ip.g.dart';

@JsonSerializable()
class DataIp {
  String? ip_address;

  DataIp({this.ip_address});

  factory DataIp.fromJson(Map<String, dynamic> data) => _$DataIpFromJson(data);

  Map<String, dynamic> toJson() => _$DataIpToJson(this);
}
