import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Controller/commentsControoler.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();
    final commentsController = Get.put(CommentsController())..commentsdata();
    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: commentsController.commentlist.value.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      TextFormField(
                        onChanged: (value) {
                          commentsController.Searchdata(value);
                        },
                        controller: textcontroller,
                        decoration: InputDecoration(
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0x30CCCCCC), width: 2)),
                            hintText: "Search",
                            hintStyle:
                                TextStyle(fontSize: 17, color: Colors.black),
                            fillColor: Color(0x30CCCCCC),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: Color(0x30CCCCCC), width: 2))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      commentsController.searchlist.value.isNotEmpty
                          ? ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: commentsController.searchlist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    leading: Text(commentsController
                                        .searchlist.value[index].id
                                        .toString()),
                                    title: Text(commentsController
                                        .searchlist[index].name
                                        .toString()));
                              },
                            )
                          : ListView.builder(
                              itemCount: commentsController.commentlist.length,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    height: 100,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListTile(
                                      //contentPadding: EdgeInsets.all(0),
                                      title: Text(commentsController
                                          .commentlist[index].name
                                          .toString()),
                                      subtitle: Text(commentsController
                                          .commentlist[index].email
                                          .toString()),
                                      trailing: Text(commentsController
                                          .commentlist[index].id
                                          .toString()),
                                    ),
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ),
      ),
    ));
  }
}
