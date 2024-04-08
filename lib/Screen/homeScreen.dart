import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Controller/homeController.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();
    final homecontroller = Get.put(HomeControoler())..homeapi();
    return Obx(
      () => SafeArea(
          child: Scaffold(
        appBar: AppBar(),
        body: homecontroller.apidata.value.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent Order",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Below are your most recent order",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromARGB(255, 72, 65, 65))),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        onChanged: (search) {
                          homecontroller.SearchData(search);
                        },
                        controller: textcontroller,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0x30CCCCCC),
                          hintText: "Search",
                          hintStyle: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                BorderSide(color: Color(0x30CCCCCC), width: 2),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13),
                            borderSide:
                                BorderSide(color: Color(0x30CCCCCC), width: 2),
                          ),
                        ),
                      ),
                      homecontroller.searchlist.value.isNotEmpty
                          ? ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: homecontroller.searchlist.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Text(homecontroller
                                      .searchlist[index].id
                                      .toString()),
                                  title: Text(homecontroller
                                      .searchlist[index].title
                                      .toString()),
                                );
                              },
                            )
                          : ListView.builder(
                              padding: EdgeInsets.all(10),
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: homecontroller.apidata.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        )),
                                    height: 240,
                                    width: MediaQuery.of(context).size.width,
                                    child: ListTile(
                                      //  contentPadding: EdgeInsets.all(0),
                                      leading: Text(homecontroller
                                          .apidata[index].userId
                                          .toString()),
                                      title: Text(homecontroller
                                          .apidata[index].title
                                          .toString()),
                                      subtitle: Text(homecontroller
                                          .apidata[index].body
                                          .toString()),
                                      trailing: Text(homecontroller
                                          .apidata[index].id
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
      )),
    );
  }
}
