import 'package:edupact/common/styles.dart';
import 'package:edupact/ui/home_page.dart';
import 'package:edupact/ui/project_page.dart';
import 'package:flutter/material.dart';

class Skeleton extends StatefulWidget {
  const Skeleton({super.key});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {

  int _selectedTab = 0;
  final List _pages = [
    const HomePage(),
    const ProjectPage(),
  ];

  void _changeTab(int index){
    setState(() {
      _selectedTab = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: primaryColor,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Project'
          ),
        ],
      ),
    );
  }
}
