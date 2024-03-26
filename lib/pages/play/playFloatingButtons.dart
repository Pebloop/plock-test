import 'package:flutter/material.dart';

playFloatingButtons() {
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
