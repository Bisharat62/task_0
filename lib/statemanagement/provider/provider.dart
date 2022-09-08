import 'package:flutter/cupertino.dart';

class Userinfo extends ChangeNotifier {
  String? name;
  String? username;
  String? address;
  String? zipcode;
  dynamic id;
  changename(String value) {
    name = value;
    ChangeNotifier();
  }

  changeusername(String value) {
    username = value;
    ChangeNotifier();
  }

  changeaddress(String value) {
    address = value;
    ChangeNotifier();
  }

  changezipcode(String value) {
    zipcode = value;
    ChangeNotifier();
  }

  changeid(dynamic value) {
    id = value;
    ChangeNotifier();
  }
}
