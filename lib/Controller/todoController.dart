import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/todoModel.dart';

class TodoController extends GetxController {
  RxList todolist = [].obs;
  RxList searchlist = [].obs;
  gettododata() async {
    var url = 'https://jsonplaceholder.typicode.com/todos';
    var responce = await http.get(Uri.parse(url));
    var decode = jsonDecode(responce.body);
    var list = decode.map((m) => Todosmodel.fromMap(m)).toList();
    todolist.clear();
    todolist.addAll(list);
    print(todolist);
  }

  search(text) {
    if (text.isEmpty) {
      searchlist.value = [];
    } else {
      searchlist.value = todolist.value
          .where((element) => element.title
              .toString()
              .toLowerCase()
              .startsWith(text.toLowerCase()))
          .toList();
    }
  }
}
