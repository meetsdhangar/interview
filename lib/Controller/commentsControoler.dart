import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/commentsModel.dart';

class CommentsController extends GetxController {
  RxList commentlist = [].obs;
  RxList searchlist = [].obs;
  commentsdata() async {
    var url = 'https://jsonplaceholder.typicode.com/comments';
    var responce = await http.get(Uri.parse(url));
    var decodedata = jsonDecode(responce.body);
    var list = decodedata.map((m) => Commentsmodel.fromMap(m)).toList();
    commentlist.clear();
    commentlist.addAll(list);
    print(commentlist);
  }

  //  SearchData(text) {
  //   searchlist.value = [];
  //   if (text.isEmpty) {
  //     searchlist.value = [];
  //   } else {
  //     searchlist.value = apidata.value
  //         .where((element) => element.title
  //             .toString()
  //             .toLowerCase()
  //             .contains(text.toLowerCase()))
  //         .toList();
  //   }

  Searchdata(searchtext) {
    searchlist.value = [];
    if (searchtext.isEmpty) {
      searchlist.value = [];
    } else {
      searchlist.value = commentlist.value
          .where((element) => element.name
              .toString()
              .toLowerCase()
              .contains(searchtext.toLowerCase()))
          .toList();
    }
  }
}
