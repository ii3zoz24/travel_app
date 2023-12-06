import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favorites_screen.dart';
import '../widgets/drawer.dart';

import '../models/trip.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrip;
  TabsScreen(this.favoriteTrip);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  int _selectIndex = 0;

  late List<Map<String, dynamic>> _screens;

  @override
  void initState() {
    // TODO: implement initState
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'Title': 'تصنيف الرحلات',
      },
      {
        'Screen': FavoritesScreen(widget.favoriteTrip),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screens[_selectIndex]['Title'])),
      drawer: DrawerTap(),
      body: _screens[_selectIndex]['Screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        currentIndex: _selectIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
