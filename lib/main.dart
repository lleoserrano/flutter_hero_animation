import 'package:flutter/material.dart';
import 'package:flutter_hero_animation/page2.dart';
import 'package:flutter_hero_animation/page2FullSize.dart';
import 'package:gif_view/gif_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF0A1273),
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
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
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
                  Text(
                    'Next Page default\n Aqui você ira navegar para proxima pagina de maneira padrão.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () => _nextPageSlow(
                Page2(
                  tag: 'nextPageSlow',
                ),
              ),
              child: Column(
                children: [
                  Hero(
                    tag: 'nextPageSlow',
                    flightShuttleBuilder:
                        (ctx, animation, direction, ctx2, ctx3) =>
                            GifView.asset(
                      'assets/dash.gif',
                      height: 200,
                      width: 200,
                    ),
                    child: FlutterLogo(
                      size: 100,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Next Page Slow\n Aqui você ira navegar para proxima pagina com a animação mais lenta, para apreciar os detalhes.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () => _nextPageSlow(
                Page2FullSize(
                  tag: 'nextPageFullSize',
                ),
              ),
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
                  Text(
                    'Next Page Full Size\n Aqui você ira navegar para proxima pagina de com a animação padrão, mas a pagina contem a estrutura de uma pagina de "descrição", isto ajudará a ter ideias de onde aplicar.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _nextPageSlow(
          Page2FullSize(
            tag: 'Page2FullSizeFloating',
          ),
        ),

        //
        /// O componente "FloatingActionButton" possui o parametro "heroTag" nativo, isto resulta em não precisarmos utilizar o Widget Hero. Basta colocar a TAG no campo "heroTag" do FAB.
        //

        heroTag: 'Page2FullSizeFloating',

        child: FlutterLogo(
          size: 40,
        ),
      ),
    );
  }

  _nextPage(Widget page) {
    // Função para navegção para proxima pagina.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return page;
        },
      ),
    );
  }

  _nextPageSlow(Widget page) {
    // Aqui navegamos para a pagina seguinte, alterando o Duration para que a transiçã seja mais lenta.
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 5000),
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
