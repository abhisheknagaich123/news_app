import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/view/home_View/Bottomanvabar.dart';
import 'package:news_app/view/home_View/widget/NewsForYou.dart';
import 'package:news_app/view/home_View/widget/TraindingCard.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News App",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: bottomnavbar(),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                child: Row(
                  children: [
                    Traindincard(),
                    Traindincard(),
                    Traindincard(),
                    Traindincard()
                  ],
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
              Column(children: [
                NewForYou(),
                NewForYou(),
                NewForYou(),
                NewForYou(),
                NewForYou()
              ])
            ],
          ),
        ),
      ),
    );
  }
}
