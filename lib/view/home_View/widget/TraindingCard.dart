import 'package:flutter/material.dart';

class Traindincard extends StatefulWidget {
  const Traindincard({super.key});

  @override
  State<Traindincard> createState() => _TraindincardState();
}

class _TraindincardState extends State<Traindincard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(6),
      height: 300,
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        children: [
          Container(
            height: 170,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.background),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                "https://static.toiimg.com/thumb/msid-108654854,imgsize-63124,width-400,resizemode-4/108654854.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tranding No 1",
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                "2 Days ago",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "UN issues 'red alert', warns 'planet on the brink' after ",
                  style: Theme.of(context).textTheme.headlineMedium,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.yellow,
              ),
              SizedBox(
                width: 10,
              ),
              Text("Abhishe Nagaich")
            ],
          ),
        ],
      ),
    );
  }
}
