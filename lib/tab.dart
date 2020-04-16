import 'package:flutter/material.dart';
import 'package:tabs/tab1.dart';
import 'package:tabs/tab2.dart';
import 'package:tabs/tab3.dart';
import 'package:tabs/tab4.dart';

class TabPage extends StatefulWidget {
  TabPage({Key key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {

  int _currentPageIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  var pages = <Widget>[
    TabPage1(),
    TabPage2(),
    TabPage3(),
    TabPage4(),
  ];

  void _pageChange(int index) {
    setState(() {
      if(_currentPageIndex != index) {
        _currentPageIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试下'),
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return pages[index];
        },
        controller: _pageController,
        onPageChanged: _pageChange,
        itemCount: 4,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.navigation),
              title: Text('哪儿'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              title: Text('私密'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              title: Text('动艺'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('我的'),
            ),
        ],
        currentIndex: _currentPageIndex,
        onTap: _onItemTapped,
        // 如果不加，4个的情况下，底部导航不显示
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  void _onItemTapped(int index) {
    _pageController.animateToPage(
      index, 
      duration: Duration(
        microseconds: 300,
      ),
      curve: Curves.ease,
    );
  }
}