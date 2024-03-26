import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poc/plock_components/plockComponentsList.dart';

class AddComponentPage extends StatelessWidget {
  final setState;
  final object;

  AddComponentPage(this.setState, this.object);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add component'),
        ),
        body: Column(
          children: <Widget>[
            Flex(direction:
            Axis.vertical,
              children: plockComponentsList.map((component) {
                return TextButton(onPressed: () {
                  setState(() {
                    object.addComponent(component);
                  });
                  Navigator.pop(context, component);
                }, child:
                Text(component.name()),
                );
              }).toList(),
            ),
          ],
        )
    );
  }
}