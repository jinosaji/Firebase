import 'package:flutter/material.dart';
import 'package:projectfire/datapage.dart';
import 'package:projectfire/login.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Fire BAse',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle the onTap action for Home menu item
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Customer'),
            onTap: () {
              // Handle the onTap action for Home menu item
              Navigator.push(context,MaterialPageRoute(builder: (context)=>Data())); // Close the drawer
              // Add your navigation logic here
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Handle the onTap action for Settings menu item
              Navigator.pop(context); // Close the drawer
              // Add your navigation logic here
            },
          ),
    ListTile(
    leading: Icon(Icons.output_sharp),
    title: Text('Sign Out'),
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
    }
    ) // Add more menu items as needed
        ],
      ),
    );
  }
}
