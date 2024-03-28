import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/View_Models/controler/Traindingnewscontroller.dart';
import 'package:news_app/shimmer_Widget/shimmer_NewsTileLoading.dart';
import 'package:news_app/shimmer_Widget/shimmer_TraindingCard.dart';

import 'package:news_app/view/home_View/Bottomanvabar.dart';
import 'package:news_app/view/home_View/NewsDetailedPage.dart';
import 'package:news_app/view/home_View/widget/NewsForYou.dart';
import 'package:news_app/view/home_View/widget/TraindingCard.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // NewsController controller = Get.put(NewsController());
  Traindingnews controller = Get.put(Traindingnews());
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  // } @override
  void dispose() {
    // Release the controllers when the widget is disposed

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.dashboard),
                  ),
                  const Text(
                    "NEWS APP",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.5,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      print("click");
                      controller.newsforyou();
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.person),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All News",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(
                  () => controller.isTrandingLoading.value
                      ? const Row(
                          children: [
                            TrandingLoadingCard(),
                            TrandingLoadingCard()
                          ],
                        )
                      : Row(
                          children: controller.trandingNewsList
                              .map((e) => TrandingCard(
                                    ontap: () {
                                      Get.to(() => NewsDetailedpage());
                                    },
                                    imageUrl: e.urlToImage ??
                                        "https://static.toiimg.com/thumb/msid-108654854,imgsize-63124,width-400,resizemode-4/108654854.jpg", // Using null-aware operator
                                    title: e.title!,
                                    author: e.author ?? "Unknown",
                                    tag: "Tranding no 1",
                                    time: e.publishedAt ?? "no time",
                                  ))
                              .toList(),
                        ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News for you",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    "See All News",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => controller.isNewsForULoading.value
                  ? Column(
                      children: [NewsTileLoading(), NewsTileLoading()],
                    )
                  : Column(
                      children: controller.NewsForYou.map((e) => NewsTile(
                            ontap: () {
                              Get.to(() => NewsDetailedpage());
                            },
                            imageUrl: e.urlToImage ??
                                "https://static.toiimg.com/thumb/msid-108654854,imgsize-63124,width-400,resizemode-4/108654854.jpg",
                            title: e.title!,
                            author: e.author ?? "Unknown",
                            time: e.publishedAt ?? "no time",
                          )).toList(),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
