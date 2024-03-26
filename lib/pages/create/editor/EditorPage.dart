import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:poc/pages/create/editor/Components/ObjectComponent.dart';
import 'package:poc/pages/create/editor/ObjectEditorPage.dart';

import 'Editor.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({Key? key}) : super(key: key);

  openEditor(context) {
    return (ObjectComponent object) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ObjectEditorPage(object)),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: GameWidget(game: Editor(openEditor(context))),
        ),
      ],
    );
  }
}
