import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Models/newsmodel/Traindingmodel.dart';

class Traindingnews extends GetxController {
  RxList<Traindingmodel> trandingNewsList = <Traindingmodel>[].obs;
  RxList<Traindingmodel> NewsForYou = <Traindingmodel>[].obs;
  RxBool isTrandingLoading = false.obs;
  RxBool isNewsForULoading = false.obs;

  RxBool isSpeeking = false.obs;

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

  Future<void> searchNews(String search) async {
    isNewsForULoading.value = true;
    var baseURL =
        "https://newsapi.org/v2/everything?q=$search&apiKey=ea97c6bb67b040759084c3c20ea5e5cf";
    try {
      var response = await http.get(Uri.parse(baseURL));
      print(response);
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        NewsForYou.clear();
        int i = 0;
        for (var news in articals) {
          i++;
          NewsForYou.add(Traindingmodel.fromJson(news));
          if (i == 10) {
            break;
          }
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForULoading.value = false;
  }

  Future<void> speak(String text) async {
    isSpeeking.value = true;
    // await flutterTts.setLanguage("en-US");
    // await flutterTts.setPitch(1);
    // await flutterTts.setSpeechRate(0.5);
    // await flutterTts.speak(text);
    isSpeeking.value = false;
  }

  void stop() async {
    // await flutterTts.stop();
    isSpeeking.value = false;
  }
}
