import 'dart:convert';

import 'package:api_bloc_2023/postModel.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';

Future<List<postModel>> getData() async {
  String url = 'https://jsonplaceholder.typicode.com/posts';
  Response response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print('response theek a raha ha ap ka ');

    List list = jsonDecode(response.body);
    var mylist = list
        .map((e) => postModel(
              id: e['id'],
              userId: e['userId'],
              body: e['body'],
              title: e['title'],
            ))
        .toList();
    return mylist;
  }
  return [];
}
