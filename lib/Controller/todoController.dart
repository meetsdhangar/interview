import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/todoModel.dart';

class TodoController extends GetxController {
  RxList todolist = [].obs;
  RxList searchlist = [].obs;
  getTododata() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var responce = await http.get(Uri.parse(url));
    print(responce);
    var decodedata = jsonDecode(responce.body);
    var list = decodedata.map((t) => Todosmodel.fromMap(t)).toList();
    todolist.clear();
    todolist.addAll(list);
    print(todolist);
  }

  getSearchdata(searchtext) {
    searchlist.value = [];
    if (searchtext.isEmpty) {
      searchlist.value = [];
    } else {
      searchlist.value = todolist.value
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .startsWith(searchtext.toLowerCase()))
          .toList();
    }
  }
}
