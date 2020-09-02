import 'package:flutter/material.dart';

class NavigateBottomItem extends StatelessWidget {
  final icon;
  final String title;
  final Function fn;
  NavigateBottomItem({this.icon, this.title, this.fn});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: icon,
            iconSize: 20,
            color: Colors.white,
            onPressed: fn,
          ),
          Text(
            title.toUpperCase(),
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
