import 'dart:convert';

import 'package:bisharat_tasks/classmodel/profileClassModel.dart';
import 'package:http/http.dart' as http;

List<ProfileClassModel> userdata = [];

class ApiProfile {
  final url = "https://jsonplaceholder.typicode.com/users";
  Future<List<ProfileClassModel>> getProfile() async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Iterable list = json.decode(res.body);
      // Map<String, dynamic> json = jsonDecode(res.body);
      // dynamic body = ProfileClassModel.fromJson(jsonDecode(res.body));
      List<ProfileClassModel> profile =
          list.map((dynamic item) => ProfileClassModel.fromJson(item)).toList();
      print(profile);
      profile.forEach((element) {
        print(element.email);
      });
      userdata = profile;
      return profile;
    } else {
      throw ("Api not fetched Successfully");
    }
  }
}
