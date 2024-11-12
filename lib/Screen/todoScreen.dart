import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview/Controller/todoController.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todocontroller = Get.put(TodoController())..gettododata();
    final textcontroller = TextEditingController();
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(),
          body: todocontroller.todolist.value.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) {
                            todocontroller.search(value);
                          },
                          controller: textcontroller,
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
                        todocontroller.searchlist.value.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: todocontroller.searchlist.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                        todocontroller.searchlist[index].title),
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: todocontroller.todolist.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    leading: Text(todocontroller
                                        .todolist[index].id
                                        .toString()),
                                    title: Text(
                                        todocontroller.todolist[index].title),
                                    trailing: Text(todocontroller
                                        .todolist[index].completed
                                        .toString()),
                                  );
                                },
                              )
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
