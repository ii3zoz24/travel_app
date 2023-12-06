import 'package:flutter/material.dart';
import 'package:travel_app/screens/filter_screen.dart';

class DrawerTap extends StatelessWidget {
  const DrawerTap({super.key});

  ListTile drawerbutten(String Title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        Title,
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.amber,
            child: Text(
              'دليل السياحة',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          drawerbutten(
            'الرحلات',
            Icons.card_travel,
            () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          drawerbutten(
            'تصفية',
            Icons.filter_list,
            () {
              Navigator.of(context)
                  .pushReplacementNamed(FilterScreen.screenRout);
            },
          ),
        ],
      ),
    );
  }
}
