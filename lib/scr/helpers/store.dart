import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/store.dart';

class StoreServices {
  String collection = "stores";
  Firestore _firestore = Firestore.instance;

  Future<List<StoreModel>> getStores() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<StoreModel> stores = [];
        for (DocumentSnapshot store in result.documents) {
          stores.add(StoreModel.fromSnapshot(store));
        }
        return stores;
      });

  Future<StoreModel> getStoreById({int id}) => _firestore
          .collection(collection)
          .document(id.toString())
          .get()
          .then((doc) {
        return StoreModel.fromSnapshot(doc);
      });

  Future<List<StoreModel>> searchStore({String storeName}) {
    // code to convert the first character to uppercase
    String searchKey = storeName[0].toUpperCase() + storeName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<StoreModel> stores = [];
          for (DocumentSnapshot product in result.documents) {
            stores.add(StoreModel.fromSnapshot(product));
          }
          return stores;
        });
  }
}
