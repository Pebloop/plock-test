
import 'package:flame/game.dart';
import 'package:flutter/widgets.dart';

import 'game1.dart';
import 'game2.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var games = [GameWidget(game: Game1()), GameWidget(game: Game2())];

    return Column(
      children: [Expanded(child: PageView(
        scrollDirection: Axis.vertical,
        children: games,
      ))
      ],
    );
  }
}