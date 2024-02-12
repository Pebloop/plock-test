import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:poc/game1.dart';

import 'game2.dart';

void main() {
  //final game = FlameGame();
  //runApp(GameWidget(game: game));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plock poc',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const DefaultTabController(
        length: 4,
        child: MyHomePage(title: 'Plock poc'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  late TabController controller;
  var game1 = Game1();
  var game2 = Game2();
  var games = [Expanded(child: GameWidget(game: Game1())), GameWidget(game: Game2())];
  late var floatingButtons;

  gameFloatingButtons() {
    return <Widget>[
      const FloatingActionButton(
        onPressed: null,
        tooltip: 'Like',
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Icon(Icons.favorite_outline, color: Colors.white),
            Text('0', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      const FloatingActionButton(
        onPressed: null,
        tooltip: 'Comment',
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Icon(Icons.comment, color: Colors.white),
            Text('0', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
      const FloatingActionButton(
        onPressed: null,
        tooltip: 'Share',
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Icon(Icons.share, color: Colors.white),
            Text('0', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
    floatingButtons = gameFloatingButtons();

    void handleTabSelection() {
      setState(() {

        if (controller.index == 0) {
          floatingButtons = gameFloatingButtons();
        } else {
          floatingButtons = <Widget>[];
        }
      });
    }

    controller.addListener(handleTabSelection);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: null,
      bottomNavigationBar: TabBar(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        tabs: const <Widget>[
        Tab(icon: Icon(Icons.play_arrow)),
        Tab(icon: Icon(Icons.search)),
        Tab(icon: Icon(Icons.add)),
        Tab(icon: Icon(Icons.settings)),
      ],
      ),
      body: TabBarView(
        controller: controller,
          children: <Widget>[
            Column(
              children: [Expanded(child: PageView(
                scrollDirection: Axis.vertical,
                children: games,
              ))
            ],
            ),
              Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
                    child: SearchBar(),
                  ),
                  SizedBox(height: 50),
                  Column(
                    children: [
                      for (var game in games)
                        Column(
                          children: [
                            Container(
                              color: Color(0xFFB6B6B6),
                              width: MediaQuery.of(context).size.width - 50,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 120,
                                        height: 100,
                                        color: Colors.red,
                                      ),
                                      const SizedBox(width: 10),
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('Game name', style: TextStyle(fontSize: 18)),
                                          Text('Game description', style: TextStyle(fontSize: 12)),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Icon(Icons.favorite_outline, color: Colors.black),
                                              Text('0', style: TextStyle(color: Colors.black)),
                                              SizedBox(width: 10),
                                              Icon(Icons.comment, color: Colors.black),
                                              Text('0', style: TextStyle(color: Colors.black)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20)
                        ]),
                    ],
                  ),
                ],
              ),
              const Icon(Icons.add),
              const Icon(Icons.settings),
          ],
      ),
      floatingActionButton: floatingButtons.isEmpty ? null : Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: floatingButtons,
      ),
    );
  }
}
