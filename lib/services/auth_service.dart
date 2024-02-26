import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:network_info_plus/network_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:supplychain_beras/services/firebase_service.dart';

import '../models/DataBeras.dart';

class AuthService {
  final FlutterSecureStorage storage = const FlutterSecureStorage();
  final FirebaseService servis = FirebaseService();
  String? baseurl = "http://192.168.1.5:4444";

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
    String? namapetani,
    String? alamat,
    String? nohp,
    String? lamapanen,
    String? tanggalpanen,
  }) async {
    var token = await gettoken();
    var ip = await servis.getdataip();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
    };
    dio.options.baseUrl = '$ip/CreateAsset';

    var formdata = FormData.fromMap({
      'Id': id,
      'Nama_Petani': namapetani,
      'Alamat': alamat,
      'No_hp': nohp,
      'Tanggal_Panen': tanggalpanen,
      'Lama_panen': lamapanen
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

  Future<DataBeras> getDataBeras({
    String? id,
  }) async {
    var token = await gettoken();
    var ip = await servis.getdataip();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl = '$ip/ReadAsset';

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
    var ip = await servis.getdataip();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl = '$ip/AssetTransfer';

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
    var ip = await servis.getdataip();
    var dio = Dio();
    dio.options.headers = {
      'Authorization': token,
      'Accept': 'application/json',
    };
    dio.options.baseUrl = '$ip/LockAsset';

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
    var ip = await servis.getdataip();
    var loginurl = await http.post(Uri.parse('$ip/login'), body: {
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
