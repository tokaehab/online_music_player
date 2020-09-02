import 'dart:math';

import 'package:flutter/material.dart';

enum Type { Left, Right, Middle }

class RecommendationItem extends StatelessWidget {
  final String imageName;
  final String name;
  final Type type;
  RecommendationItem.left(this.imageName, this.name) : type = Type.Left;
  RecommendationItem.middle(this.imageName, this.name) : type = Type.Middle;
  RecommendationItem.right(this.imageName, this.name) : type = Type.Right;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: type == Type.Left ? 15 : 5, right: type == Type.Right ? 15 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                child: Image.asset(
                  imageName,
                  fit: BoxFit.cover,
                  width: min(350, MediaQuery.of(context).size.width * 0.65),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).textScaleFactor * 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
