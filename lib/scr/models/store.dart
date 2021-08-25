import 'package:cloud_firestore/cloud_firestore.dart';

class StoreModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const RATES = "rates";
  static const IMAGE = "image";
  static const POPULAR = "popular";
  static const USER_LIKES = "userLikes";

  int _id;
  String _name;
  String _image;
  List<String> _userLikes;
  num _rating;
  num _avgPrice;
  bool _popular;
  int _rates;

//  getters
  int get id => _id;

  String get name => _name;

  String get image => _image;

  List<String> get userLikes => _userLikes;

  num get avgPrice => _avgPrice;

  num get rating => _rating;

  bool get popular => _popular;

  int get rates => _rates;

  // public variable
  bool liked = false;

  StoreModel.fromSnapshot(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _image = snapshot.data[IMAGE];
    _avgPrice = snapshot.data[AVG_PRICE];
    _rating = snapshot.data[RATING];
    _popular = snapshot.data[POPULAR];
    _rates = snapshot.data[RATES];
  }
}
