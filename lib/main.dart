import 'package:flutter/material.dart';
import 'package:poc/pages/create/CreatePage.dart';
import 'package:poc/pages/create/createFloatingButtons.dart';
import 'package:poc/pages/play/PlayFloatingButtons.dart';
import 'package:poc/pages/play/PlayPage.dart';
import 'package:poc/pages/profile/ProfilePage.dart';
import 'package:poc/pages/search/SearchPage.dart';

void main() {
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
  late var floatingButtons;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this, initialIndex: 0);
    floatingButtons = playFloatingButtons();

    void handleTabSelection() {
      setState(() {
        if (controller.index == 0) {
          floatingButtons = playFloatingButtons();
        } else if (controller.index == 2) {
          floatingButtons = createFloatingButtons(context);
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
          Tab(icon: Icon(Icons.create)),
          Tab(icon: Icon(Icons.settings)),
        ],
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          const PlayPage(),
          const SearchPage(),
          CreatePage(),
          const ProfilePage(),
        ],
      ),
      floatingActionButton: floatingButtons.isEmpty
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: floatingButtons,
            ),
    );
  }
}
