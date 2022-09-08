import 'dart:convert';

import 'package:bisharat_tasks/classmodel/postsClassModel.dart';
import 'package:http/http.dart' as http;

List<PostsClassModel> allposts = [];

class ApiPosts {
  final url = "https://jsonplaceholder.typicode.com/posts";
  Future<List<PostsClassModel>> getPosts() async {
    final res = await http.get(Uri.parse(url));
    if (res.statusCode == 200) {
      Iterable list = json.decode(res.body);

      // dynamic body = ProfileClassModel.fromJson(jsonDecode(res.body));
      List<PostsClassModel> posts =
          list.map((dynamic item) => PostsClassModel.fromJson(item)).toList();
      allposts = posts;
      // print(posts);
      return posts;
    } else {
      throw ("Api not fetched Successfully");
    }
  }
}


// class CharacterApi {
//   static Future getCharacters() {
//     return http.get("https://breakingbadapi.com/api/characters");
//   }
// }

// List<Character> characterList = new List<Character>();

// void getCharactersfromApi() async {
//     CharacterApi.getCharacters().then((response) {
//       setState(() {
//         Iterable list = json.decode(response.body);
//         characterList = list.map((model) => Character.fromJson(model)).toList();
//       });
//     });
//   }