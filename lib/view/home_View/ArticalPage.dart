import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/home_View/widget/Search.dart';

import '../../View_Models/controler/Traindingnewscontroller.dart';
import 'widget/NewsForYou.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    Traindingnews controller = Get.put(Traindingnews());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
              Obx(
                () => Column(
                  children: controller.NewsForYou.map(
                    (e) => NewsTile(
                      ontap: () {
                        // Get.to(NewsDetailsPage(news: e));
                      },
                      imageUrl: e.urlToImage ??
                          "https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/01/16/317_1705413514.jpg",
                      title: e.title!,
                      author: e.author ?? "Unknown",
                      time: e.publishedAt!,
                    ),
                  ).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
