import 'package:flutter/material.dart';
import '../helpers/store.dart';
import '../models/store.dart';

class StoreProvider with ChangeNotifier {
  StoreServices _storeServices = StoreServices();
  List<StoreModel> stores = [];
  List<StoreModel> searchedStores = [];

  StoreModel store;

  StoreProvider.initialize() {
    loadStores();
  }

  loadStores() async {
    stores = await _storeServices.getStores();
    notifyListeners();
  }

  loadSingleStore({int storeId}) async {
    store = await _storeServices.getStoreById(id: storeId);
    notifyListeners();
  }

  Future search({String name}) async {
    searchedStores = await _storeServices.searchStore(storeName: name);
    print("STORES ARE: ${searchedStores.length}");
    notifyListeners();
  }
}
