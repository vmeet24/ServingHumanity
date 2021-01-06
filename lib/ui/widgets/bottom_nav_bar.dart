import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  final dynamic model;
  BottomNavBar({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 5)]),
      child: BottomNavigationBar(
        selectedItemColor: Color(0xffEE3E42),
        currentIndex: model.currentTab,
        onTap: (index) => model.updateTab(index),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.calendar),
            title: Text('Camps'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.images),
            title: Text('Gallery'),
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.donate),
            title: Text('Donate'),
          ),
        ],
      ),
    );
  }
}
