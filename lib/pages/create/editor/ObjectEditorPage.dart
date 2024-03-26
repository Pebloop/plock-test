import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poc/pages/create/editor/AddComponentPage.dart';
import 'package:poc/plock_components/RectanglePlockComponent.dart';

import 'Components/ObjectComponent.dart';

class ObjectEditorPage extends StatefulWidget {
  final ObjectComponent object;

  ObjectEditorPage(this.object);

  @override
  State<StatefulWidget> createState() {
    return ObjectEditorPageState(object);
  }
}

class ObjectEditorPageState extends State<ObjectEditorPage> {
  final ObjectComponent object;

  ObjectEditorPageState(this.object);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit object'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Name',
            ),
            controller: TextEditingController(text: object.name),
            onChanged: (text) {
              object.name = text;
            },
          ),
          Text('Components'),
          Column(
            children: object.plockComponents.map((component) {
              return Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  TextButton(onPressed: () {}, child:
                  Text(component.name()),
                  ),
                  TextButton(onPressed: () {
                    setState(() {
                      object.removeComponent(component);
                    });
                  }, child:
                  Text('delete'),
                  ),
                ],
              );
            }).toList() + [Flex(direction: Axis.horizontal, children: <Widget>[
              TextButton(onPressed: () {

                Navigator.push(context, MaterialPageRoute(builder: (context) => AddComponentPage(setState, object)));

              }, child:
              Text('Add component'),
              ),
            ])],
          ),
        ],
      ),
    );
  }



}