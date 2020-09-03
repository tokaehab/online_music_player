import 'package:flutter/material.dart';
import 'package:online_music_player/screens/play_screen.dart';

class MostLikedItem extends StatelessWidget {
  String imageName;
  MostLikedItem(this.imageName);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext ctx) => PlayScreen(imageName, 'Song Name')));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  child: Hero(
                    tag: imageName,
                    child: Image.asset(
                      imageName,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(5),
                  child: Text(
                    'Song Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).textScaleFactor * 16,
                    ),
                  ),
                ),
                IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {
                      // add to favorites or remove from favorites
                    })
              ],
            ))
          ],
        ),
      ),
    );
  }
}
