import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key, required this.tag}) : super(key: key);
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Hero(tag: tag, child: FlutterLogo()),
          ),
        ],
      ),
    );
  }
}
