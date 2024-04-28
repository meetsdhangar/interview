import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/albumsModel.dart';

class AlbumControoler extends GetxController {
  RxList albumslist = [].obs;
  RxList Searchlist = [].obs;
  albumdata() async {
    var url = 'https://jsonplaceholder.typicode.com/albums';
    var responce = await http.get(Uri.parse(url));
    var decodedata = jsonDecode(responce.body);
    var mylist = decodedata.map((a) => Albumsmodel.fromMap(a));
    albumslist.clear();
    albumslist.addAll(mylist);
    print(albumslist);
  }

  searchdata(text) {
    Searchlist.value = [];
    if (text.isEmpty) {
      Searchlist.value = [];
    } else {
      Searchlist.value = albumslist.value
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .contains(text.toLowerCase()))
          .toList();
    }
  }
}
