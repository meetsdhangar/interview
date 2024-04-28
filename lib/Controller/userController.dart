import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/userModel.dart';

class UserController extends GetxController {
  RxList userlist = [].obs;
  getuserdata() async {
    var url = 'https://jsonplaceholder.typicode.com/users';
    var responce = await http.get(Uri.parse(url));
    var decodedata = jsonDecode(responce.body);
    var list = decodedata.map((u) => Usermodel.fromMap(u)).toList();
    userlist.clear();
    userlist.addAll(list);
    print(userlist);
    //  var data = decodedata['address'];
   
  }
}
