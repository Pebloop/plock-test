import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        Container(
          width: MediaQuery.of(context).size.width - 50,
          child: SearchBar(),
        ),
        SizedBox(height: 50),
        Column(
          children: [
            for (var game in [1,2])
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
    );
  }
}