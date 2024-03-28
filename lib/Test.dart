import 'package:flutter/material.dart';
import 'package:news_app/shimmer_Widget/shimmer.dart';
import 'package:news_app/shimmer_Widget/shimmer_NewsTileLoading.dart';
import 'package:news_app/view/home_View/widget/TraindingCard.dart';
import 'package:shimmer/shimmer.dart';

class Testapp extends StatelessWidget {
  const Testapp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [NewsTileLoading(), NewsTileLoading()],
      ),
    ));
  }
}
