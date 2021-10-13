import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:meetmeal/pages/explore/explore_page.dart';
import 'package:meetmeal/pages/like&bucket_list/like_bucket_list.dart';

class BottomNavigationAnimated extends StatefulWidget {
  _BottomNavigationAnimatedState createState() =>
      _BottomNavigationAnimatedState();
}

class _BottomNavigationAnimatedState extends State<BottomNavigationAnimated> {
  PageController _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => currentIndex = index);
        },
        children: <Widget>[
          ExplorePage(),
          LikeBucketList(),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
        containerHeight: 70,
        showElevation: true,
        selectedIndex: currentIndex,
        items: [
          BottomNavyBarItem(
            icon: Icon(
              Ionicons.ios_home,
            ),
            title: Text("Home"),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(
              Ionicons.md_heart,
            ),
            title: Text("Likes"),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
          BottomNavyBarItem(
            icon: Icon(Ionicons.ios_settings),
            title: Text("Home"),
            activeColor: Colors.blue,
            inactiveColor: Colors.grey,
          ),
        ],
        onItemSelected: (index) =>
            setState(() => _pageController.jumpToPage(index)),
      ),
    );
  }
}
