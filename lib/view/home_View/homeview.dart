import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/View_Models/controler/FirebaseLogin/firebase_login.dart';
import 'package:news_app/View_Models/controler/Traindingnewscontroller.dart';
import 'package:news_app/View_Models/controler/user_prefernce/user_prefrence.dart';
import 'package:news_app/res/routes/routes.dart';
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
  final LoginController _controller = Get.put(LoginController());
  UserPreference userPreference = UserPreference();
  User? user = FirebaseAuth.instance.currentUser;
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: user != null
                          ? Image.network(
                              user!.photoURL ??
                                  "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjg9hzTaf28CoQ11WqVsW-hgec_W_GXJlHabFy94PPsELvpRXFbF0uuSGYXnOErT3CkMIZYsPeL1Ukg0yautWbNllrn6xZyHisCdlOK-NWl6JFyIvmJnlCLedVMIAK4XgeDHLCIFMTJDAz3NOz2jwNSxs3Gawo7UJMPM23hDowyM3_DeF3gX7fcoptSs1E/s164/person.png",
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/person.png',
                              fit: BoxFit.cover,
                            ),
                    ),
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
                      _controller.logout();
                      // Get.to(Login());
                      // Get.toNamed(RouteName.loginView);
                      userPreference.removeUser().then((value) {
                        Get.toNamed(RouteName.loginView);
                      });
                      print("logout Icon Clicked");
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(
                        Icons.logout,
                      ),
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
                  // Text(
                  //   "See All News",
                  //   style: Theme.of(context).textTheme.labelSmall,
                  // )
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
                                      Get.to(() => NewsDetailsPage(
                                            news: e,
                                          ));
                                    },
                                    imageUrl: e.urlToImage ??
                                        "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhWPL51z4fYdKctuvRMoy-zaTLoF2h4CggcaCYaJgh2V8Vo3AXdkP-C2-K0VCkcd5TpaCKLaNpig5oHiy9UVEGr2Vlq85ngUhG1qXSZ9xIaLshpVGQ2ezJEGXEtbtNXB_cYM1XoUnnLnkgdY6FjX5JzhJ8h8G8CQnOu9p-JLexfYYo0gKBsT1_5DeQmqWE/s249/noimg.png",
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
                              Get.to(() => NewsDetailsPage(
                                    news: e,
                                  ));
                            },
                            imageUrl: e.urlToImage ??
                                "https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhWPL51z4fYdKctuvRMoy-zaTLoF2h4CggcaCYaJgh2V8Vo3AXdkP-C2-K0VCkcd5TpaCKLaNpig5oHiy9UVEGr2Vlq85ngUhG1qXSZ9xIaLshpVGQ2ezJEGXEtbtNXB_cYM1XoUnnLnkgdY6FjX5JzhJ8h8G8CQnOu9p-JLexfYYo0gKBsT1_5DeQmqWE/s249/noimg.png",
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
