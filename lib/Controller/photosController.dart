import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:interview/Model/photosModel.dart';

class PhotosController extends GetxController {
  RxList photolist = [].obs;
  getphotodata() async {
    var url = ' /photos';
    var responce = await http.get(Uri.parse(url));
    var decodedata = jsonDecode(responce.body);
    var list = decodedata.map((p) => Photosmodel.fromMap(p));
    photolist.clear();
    photolist.addAll(list);
  }
}
