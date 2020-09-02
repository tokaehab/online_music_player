import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:online_music_player/widgets/most_liked_item.dart';
import 'package:online_music_player/widgets/navigate_bottom_item.dart';
import 'package:online_music_player/widgets/recommendation_item.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool swapped = false;
  ScrollController _controller = ScrollController();

  Widget searchBar() {
    return AnimatedAlign(
      duration: Duration(
        milliseconds: 400,
      ),
      alignment: swapped ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for artist, song...',
            hintStyle: TextStyle(
              color: Colors.white,
            ),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.white),
          onChanged: (value) {
            if (value.isEmpty && swapped) {
              setState(() {
                swapped = false;
              });
            } else if (value.isNotEmpty && !swapped) {
              setState(() {
                swapped = true;
              });
            }
          },
        ),
      ),
    );
  }

  Widget searchIconButton() {
    return AnimatedAlign(
      duration: Duration(milliseconds: 400),
      alignment: swapped ? Alignment.centerRight : Alignment.centerLeft,
      child: IconButton(
          icon: Icon(Icons.search),
          color: Colors.white,
          onPressed: () {
            //TODO search
          }),
    );
  }

  Widget avtar() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.asset(
          'assets/p2.jpg',
          width: MediaQuery.of(context).size.width * 0.1,
          height: AppBar().preferredSize.height * 0.5,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.2),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Stack(
              children: <Widget>[
                searchBar(),
                searchIconButton(),
              ],
            )),
        actions: <Widget>[
          avtar(),
        ],
      ),
      body: Stack(
        children: <Widget>[
          CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    'Recommendation',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).textScaleFactor * 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      RecommendationItem.left('assets/p1.jpg', 'First Song'),
                      RecommendationItem.middle('assets/p3.jpg', 'Second Song'),
                      RecommendationItem.right('assets/p4.jpg', 'Third Song'),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.all(20),
                  child: Text(
                    'Most Liked',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).textScaleFactor * 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SliverFillRemaining(
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 1,
                  ),
                  children: <Widget>[
                    MostLikedItem('assets/p6.jpg'),
                    MostLikedItem('assets/p7.jpg'),
                    MostLikedItem('assets/p3.jpg'),
                    MostLikedItem('assets/p4.jpg'),
                    MostLikedItem('assets/avatar.png'),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(bottom: 100.0),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: NavigateBottomItem(
                            icon: Icon(Icons.explore),
                            title: "Explore",
                            fn: () {
                              // Naviagte to Discover screen
                            },
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: NavigateBottomItem(
                            icon: Icon(Icons.favorite),
                            title: "Your Likes",
                            fn: () {
                              // Navigate to Likes Screen
                            },
                          )),
                      Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: NavigateBottomItem(
                            icon: Icon(Icons.add_circle),
                            title: "Upload",
                            fn: () {
                              // Navigate to upload screen
                            },
                          )),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: NavigateBottomItem(
                          icon: Icon(Icons.account_circle),
                          title: "Profile",
                          fn: () {
                            // Navigate to profile screen
                          },
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: NavigateBottomItem(
                          icon: Icon(Icons.exit_to_app),
                          title: "Log Out",
                          fn: () {
                            // logout
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
