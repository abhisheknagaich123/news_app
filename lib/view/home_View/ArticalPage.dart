import 'package:flutter/material.dart';

class ArticalPage extends StatefulWidget {
  const ArticalPage({super.key});

  @override
  State<ArticalPage> createState() => _ArticalPageState();
}

class _ArticalPageState extends State<ArticalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Artical Page"),
      ),
    );
  }
}
