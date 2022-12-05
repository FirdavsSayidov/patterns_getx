

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';

class CreateController extends GetxController{
  var titleController = TextEditingController();
  var bodyController = TextEditingController();
  var userIdController = TextEditingController();

  bool isLoading = false;
  List<Post> items = [];

  void apiPostList() async {

      isLoading = true;

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

      if (response != null) {
        items = Network.parsePostList(response);
      } else {
        items = [];
      }
      isLoading = false;

  }

  void apiPostCreate(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {

        apiPostList()


    });
  }

  doCreate(){
    String title = titleController.text.toString().trim();
    String userid = userIdController.text.toString().trim();
    String body = bodyController.text.toString().trim();
    apiPostCreate(Post(id: 1, title: title, body: body, userId:1));

  }
}