import 'package:flutter/material.dart';
import 'package:flutter_hero_animation/page2.dart';
import 'package:flutter_hero_animation/page2FullSize.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hero animations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget spotlight = Container();

  Widget logoA = FlutterLogo(
    size: 100,
    style: FlutterLogoStyle.markOnly,
  );

  Widget logoB = FlutterLogo(
    size: 100,
    style: FlutterLogoStyle.stacked,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero animations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _nextPage(Page2(
                tag: 'nextPage',
              )),
              child: Column(
                children: [
                  Hero(
                    tag: 'nextPage',
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Next Page'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => _nextPageSlow(Page2(
                tag: 'nextPageSlow',
              )),
              child: Column(
                children: [
                  Hero(
                    tag: 'nextPageSlow',
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Next Page Slow'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => _nextPageSlow(Page2FullSize(
                tag: 'nextPageFullSize',
              )),
              child: Column(
                children: [
                  Hero(
                    tag: 'nextPageFullSize',
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Next Page Full Size'),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _nextPageSlow(Page2FullSize(
          tag: 'Page2FullSizeFloating',
        )),
        heroTag: null,
        child: Hero(
          tag: 'Page2FullSizeFloating',
          child: FlutterLogo(
            size: 40,
          ),
        ),
      ),
    );
  }

  _nextPage(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return page;
    }));
  }

  _nextPageSlow(Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 1000),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return page;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }
}
