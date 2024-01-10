import 'package:edupact/common/styles.dart';
import 'package:edupact/ui/activity_page.dart';
import 'package:edupact/ui/home_page.dart';
import 'package:edupact/ui/profile_page.dart';
import 'package:edupact/ui/project_page.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ProjectPage(),
    const ActivityPage(),
    const ProfilePage()
  ];

  void _changeTab(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 5.0,
        unselectedFontSize: 5.0,
        type: BottomNavigationBarType.fixed,
        items:  [
          buildBottomNavigationBarItem(
            Icons.home,
            'Home',
            0,
          ),
          buildBottomNavigationBarItem(
            Icons.work,
            'Project',
            1,
          ),
          buildBottomNavigationBarItem(
            Icons.history,
            'Activity',
            2,
          ),
          buildBottomNavigationBarItem(
            Icons.person,
            'Profile',
            3,
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(IconData iconData, String label, int index) {
    return BottomNavigationBarItem(
      icon: Container(
        height: 65,
        width: 75,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: _selectedIndex == index ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(25.0)
        ),
        child: Column(
          children: [
            Icon(
              iconData,
              color: _selectedIndex == index ? Colors.white : primaryColor,
            ),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: _selectedIndex == index ? Colors.white : primaryColor,
              ),
            )
          ],
        ),
      ),
      label: '',
    );
  }
}
