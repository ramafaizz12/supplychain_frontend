import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../models/DataBeras.dart';

class AuthService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  var baseurl = "http://10.163.10.46:4444";

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<String?> gettoken() async {
    var value = await storage.read(key: 'token');
    return value;
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<bool> createasset({
    String? id,
    String? jenisberas,
    String? namapetani,
    String? alamat,
    String? tanggalpanen,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
    };
    dio.options.baseUrl = '$baseurl/CreateAsset';

    var formdata = FormData.fromMap({
      'Id': id,
      'Jenis_Beras': jenisberas,
      'Nama_Petani': namapetani,
      'Alamat': alamat,
      'Tanggal_Panen': tanggalpanen,
    });
    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<DataBeras> GetDataBeras({
    String? id,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl = '$baseurl/ReadAsset';

    var formdata = FormData.fromMap({
      'Id': id,
    });
    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    var databaru =
        jsonDecode(response.toString())['result'] as Map<String, dynamic>;

    var databeras = DataBeras.fromJson(databaru);

    return databeras;
  }

  Future<bool> transferasset({
    String? id,
    String? tanggaldiolah,
    String? alamatperusahaan,
    String? jumlah,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl = '$baseurl/AssetTransfer';

    var formdata = FormData.fromMap({
      'Id': id,
      'Tanggal_Diolah': tanggaldiolah,
      'Alamat_Perusahaan': alamatperusahaan,
      'Jumlah': jumlah,
    });
    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> lockasset({
    String? id,
  }) async {
    var token = await gettoken();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl = '$baseurl/LockAsset';

    var formdata = FormData.fromMap({
      'Id': id,
    });
    var response = await dio.post(
      dio.options.baseUrl,
      data: formdata,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future loginapi(String? email, String? password, String? organization) async {
    var loginurl = await http.post(Uri.parse('$baseurl/login'), body: {
      'email': email,
      'password': password,
      'organization': organization
    });

    var data = jsonDecode(loginurl.body)['payload']['token'];

    return data;
  }

  Future<String> gettingIP() async {
    await Permission.location.request();
    final info = NetworkInfo();
    String? hostAddress;
    await info.getWifiIP().then((value) => hostAddress = value);

    return hostAddress!;
  }
}
