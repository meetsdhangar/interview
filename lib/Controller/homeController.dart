import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/homemodel.dart';

class HomeControoler extends GetxController {
  RxList apidata = [].obs;
  RxList searchlist = [].obs;

  homeapi() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    var responce = await http.get(Uri.parse(url));
    // try {
    var data = jsonDecode(responce.body);

    var list = data.map((m) => Homemodel.fromMap(m)).toList();
    apidata.clear();
    apidata.addAll(list);
    print(apidata);
    // } catch (e) {
    // e.toString();
  }

  SearchData(text) {
    searchlist.value = [];
    if (text.isEmpty) {
      searchlist.value = [];
    } else {
      searchlist.value = apidata.value
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    }
  }
}
