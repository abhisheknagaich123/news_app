import 'package:flutter/material.dart';
import 'package:news_app/shimmer_Widget/shimmer.dart';

class NewsTileLoading extends StatelessWidget {
  const NewsTileLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          shimmer(width: 120, hight: 120),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const shimmer(
                      width: 30,
                      hight: 30,
                    ),
                    const SizedBox(width: 10),
                    shimmer(
                      width: MediaQuery.of(context).size.width / 2.3,
                      hight: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                shimmer(
                  width: MediaQuery.of(context).size.width / 1.6,
                  hight: 15,
                ),
                const SizedBox(height: 10),
                shimmer(
                  width: MediaQuery.of(context).size.width / 1.8,
                  hight: 15,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmer(
                      width: MediaQuery.of(context).size.width / 5,
                      hight: 15,
                    ),
                    shimmer(
                      width: MediaQuery.of(context).size.width / 5,
                      hight: 15,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
