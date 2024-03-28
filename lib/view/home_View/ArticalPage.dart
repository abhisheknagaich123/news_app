import 'package:flutter/material.dart';
import 'package:news_app/view/home_View/widget/NewsForYou.dart';
import 'package:news_app/view/home_View/widget/Search.dart';

class ArticalPage extends StatefulWidget {
  const ArticalPage({super.key});

  @override
  State<ArticalPage> createState() => _ArticalPageState();
}

class _ArticalPageState extends State<ArticalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              SearchWidget(),
              SizedBox(
                height: 50,
              ),
              // NewForYou(),
              // NewForYou(),
              // NewForYou(),
              // NewForYou(),
              // NewForYou()
            ],
          ),
        )),
      ),
    );
  }
}
