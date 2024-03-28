import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/newsmodel/Traindingmodel.dart';

class Traindingnews extends GetxController {
  RxList<Traindingmodel> trandingNewsList = <Traindingmodel>[].obs;
  RxList<Traindingmodel> NewsForYou = <Traindingmodel>[].obs;
  RxBool isTrandingLoading = false.obs;
  RxBool isNewsForULoading = false.obs;
  void onInit() async {
    super.onInit();
    getTranding();
    newsforyou();
  }

  Future<void> getTranding() async {
    isTrandingLoading.value = true;
    try {
      print("ram ram getTranding()");

      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1a5deca8390a41b59e537f3fdb3d38b2'));

      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          trandingNewsList.add(Traindingmodel.fromJson(news));
        }
        // print(trandingNewsList.toString());
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isTrandingLoading.value = false;
  }

  Future<void> newsforyou() async {
    isNewsForULoading.value = true;

    try {
      print("ram ram newsforyou");

      var response = await http.get(Uri.parse(
          'https://newsapi.org/v2/everything?domains=wsj.com&apiKey=1a5deca8390a41b59e537f3fdb3d38b2'));

      if (response.statusCode == 200) {
        // print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          NewsForYou.add(Traindingmodel.fromJson(news));
        }
        // print(NewsForYou.toString());
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForULoading.value = false;
  }
}
