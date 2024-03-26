import 'package:flutter/material.dart';
import 'package:poc/pages/create/editor/EditorPage.dart';

import 'CreatePage.dart';

onPressed(context) {
  return () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditorPage()),
    );
  };
}

createFloatingButtons(context) {
  return <Widget>[
    FloatingActionButton(
      onPressed: onPressed(context),
      tooltip: 'Add',
      backgroundColor: Colors.black,
      child: Icon(Icons.add, color: Colors.white),
    ),
  ];
}
