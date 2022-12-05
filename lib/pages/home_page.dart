import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:patterns_getx/controllers/home_controller.dart';

import '../view/home_view.dart';
import 'create_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
   controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("setState"),
      ),
      body: Obx(
          ()=>Stack(
            children: [
              ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(controller,controller.items[index]);
                },
              ),
              controller.isLoading()
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : const SizedBox.shrink(),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushReplacementNamed(context, CreatePage.id);

        },
        child: const Icon(Icons.add),
      ),
    );
  }


}