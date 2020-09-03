import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  String imageName;
  String songName;
  bool recommendations;
  PlayScreen(this.imageName, this.songName, [this.recommendations = false]);
  @override
  _PlayScreenState createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int second;
  @override
  void initState() {
    super.initState();
    second = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Now Playing',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
              color: Colors.white,
              icon: Icon(Icons.favorite),
              onPressed: () {
                // change the favorite state
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                top: 50,
                bottom: 35,
              ),
              child: Center(
                child: Hero(
                  tag: widget.recommendations
                      ? widget.imageName + '\$'
                      : widget.imageName,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      widget.imageName,
                      width: MediaQuery.of(context).size.width * 0.7,
                      height: MediaQuery.of(context).size.height * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                widget.songName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    "--:--",
                    style: TextStyle(color: Colors.white),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Slider(
                      activeColor: Colors.red,
                      onChanged: (d) {
                        setState(() {
                          second = d.round();
                        });
                      },
                      value: 1.0 * second,
                      min: 0,
                      max: 100,
                    ),
                  ),
                  Text(
                    "--:--",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.pause_circle_outline),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
