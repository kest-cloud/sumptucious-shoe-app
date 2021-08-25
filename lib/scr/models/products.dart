import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const PRICE = "price";
  static const STORE_ID = "storeId";
  static const STORE = "store";
  static const DESCRIPTION = "description";
  static const CATEGORY = "category";
  static const FEATURED = "featured";
  static const RATES = "rates";
  static const USER_LIKES = "userLikes";

  int _id;
  String _name;
  int _storeId;
  String _store;
  String _category;
  String _image;
  String _description;

  num _rating;
  int _price;
  int _rates;

  bool _featured;

  int get id => _id;

  String get name => _name;

  String get store => _store;

  String get category => _category;

  String get description => _description;

  String get image => _image;

  num get rating => _rating;

  int get price => _price;

  bool get featured => _featured;

  int get rates => _rates;

  int get storeId => _storeId;

  // public variable
  bool liked = false;

  ProductModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _image = snapshot.data[IMAGE];
    _store = snapshot.data[STORE];
    _storeId = snapshot.data[STORE_ID];
    _description = snapshot.data[DESCRIPTION];
    _featured = snapshot.data[FEATURED];
    _price = snapshot.data[PRICE].floor();
    _category = snapshot.data[CATEGORY];
    _rating = snapshot.data[RATING];
    _rates = snapshot.data[RATES];
    _name = snapshot.data[NAME];
  }
}
