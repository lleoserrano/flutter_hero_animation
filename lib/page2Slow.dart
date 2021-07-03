import 'package:flutter/material.dart';

class Page2Slow extends StatelessWidget {
  const Page2Slow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: Hero(tag: 'nextPageSlow', child: FlutterLogo()),
          ),
        ],
      ),
    );
  }
}
