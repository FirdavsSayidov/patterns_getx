import 'package:get/get.dart';
import 'package:http/http.dart';

import '../model/post_model.dart';
import '../services/http_service.dart';

class HomeController extends GetxController{
  var isLoading = false.obs;
  var items = [].obs;

  Future apiPostList() async {
      isLoading(true);
    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());
      if (response != null) {
        items.value = Network.parsePostList(response);
      } else {
        items.value = [];
      }
      isLoading(false);
  }

  Future<bool> apiPostDelete(Post post) async {
      isLoading(true);

    var response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
      isLoading(false);
      return response != null;
  }

  void apiPostUpdate(Post post) {
    Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
        apiPostList()

    });
  }


}