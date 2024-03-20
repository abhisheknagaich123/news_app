import 'dart:math';

import 'package:flutter/material.dart';

class NewForYou extends StatefulWidget {
  const NewForYou({super.key});

  @override
  State<NewForYou> createState() => _NewForYouState();
}

class _NewForYouState extends State<NewForYou> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Row(children: [
        Container(
          height: 120,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.background),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://static.toiimg.com/thumb/msid-108622861,imgsize-1866285,width-400,resizemode-4/108622861.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.yellow,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Abhishe Nagaich")
              ]),
              SizedBox(
                height: 15,
              ),
              Text(
                "UN issues 'red alert', warns 'planet on the brink' after UN issues 'red alert', warns 'planet on the brink' after",
                // style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 2,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "2 Day ago",
                style: Theme.of(context).textTheme.labelSmall,
              )
            ],
          ),
        )
      ]),
    );
  }
}
