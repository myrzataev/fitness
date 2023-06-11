import 'package:BodyPower/features/blogger/presentation/screens/home_page.dart';
import 'package:BodyPower/features/news_page/presentation/screens/news_page.dart';
import 'package:BodyPower/features/blogger/presentation/screens/timetable_page.dart';
import 'package:BodyPower/internal/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/user/presentation/screens/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageScreen(),
    TimeTableScreen(),
    NewsPageScreen(),
  ];

  void onSelectTab(int index) {
    if (_selectedTab == index) return;

    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          "assets/images/BODYPOWER.png",
          width: 136.w,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          ),
          SizedBox(
            width: 15.w,
          )
        ],
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: ColorHelper.backgroundColor,
      body: _widgetOptions[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          selectedItemColor: ColorHelper.blue01DDEB,
          unselectedItemColor: Colors.white,
          backgroundColor: const Color(0xff878383),
          onTap: onSelectTab,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today), label: "DESK"),
            BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: "NEWS"),
          ]),
    );
  }
}
