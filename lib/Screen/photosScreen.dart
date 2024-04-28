import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Controller/photosController.dart';

class PhotoSCreen extends StatelessWidget {
  const PhotoSCreen({super.key});

  @override
  Widget build(BuildContext context) {
    final photosController = Get.put(PhotosController())..getphotodata();
    return SafeArea(
        child: Obx(
      () => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Photos"),
        ),
        body: photosController.photolist.value.isEmpty
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: photosController.photolist.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 250,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return
                              // Column(
                              //   crossAxisAlignment: CrossAxisAlignment.start,
                              //   children: [
                              //     Text(photosController.photolist[index].title
                              //         .toString()),
                              //     SizedBox(
                              //       height: 10,
                              //     ),
                              Container(
                            child: Image.network(
                                photosController.photolist[index].url),
                            // decoration: BoxDecoration(
                            //   image: DecorationImage(
                            //     image: NetworkImage(
                            //       photosController.photolist[index].url,
                            //     ),
                            //     fit: BoxFit.cover,
                            //   ),
                            // ),
                          );
                          //   ],
                          // );
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
