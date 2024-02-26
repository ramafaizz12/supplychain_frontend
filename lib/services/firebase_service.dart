import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplychain_beras/models/data_ip.dart';

class FirebaseService {
  final CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('supplychain');

  Future<String> getdataip() async {
    final DocumentReference docRef = collectionRef.doc("Supplychain");
    var data = await docRef.get().then((value) => value.get('data'));
    var newdata = DataIp.fromJson(data);
    return newdata.ip_address!;
  }
}
