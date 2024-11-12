import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Controller/albumsController.dart';
import 'package:interview/Model/albumsModel.dart';

class AlbumScreen extends StatelessWidget {
  const AlbumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final albumControoler = Get.put(AlbumControoler())..albumdata();
    final textcontroolwr = TextEditingController();
    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: albumControoler.albumslist.value.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: textcontroolwr,
                        onChanged: (value) {
                          albumControoler.searchdata(value);
                        },
                        decoration: InputDecoration(
                            hintText: "Search",
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Color(0x30CCCCCC), width: 2),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0x30CCCCCC), width: 2))),
                      ),
                      albumControoler.Searchlist.value.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: albumControoler.Searchlist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                      albumControoler.Searchlist[index].title),
                                );
                              },
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: albumControoler.albumslist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text(albumControoler
                                      .albumslist[index].id
                                      .toString()),
                                  title: Text(
                                      albumControoler.albumslist[index].title),
                                );
                              },
                            )
                    ],
                  ),
                ),
              ),
      ),
      
    ));
  }
}
