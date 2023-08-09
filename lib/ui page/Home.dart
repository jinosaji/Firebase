import 'package:flutter/material.dart';
import 'Drawer page.dart';
import 'package:projectfire/Screen/food.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Datas'),


      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Your App',
              style: TextStyle(fontSize: 24.0),
            ),
            ElevatedButton(
              onPressed: () {

                Navigator.push(context,MaterialPageRoute(builder: (context)=>Food()));
              }, child: null,
             
            ),

       // Add more widgets as needed
          ],
          
        ),
      ),
      // Add other navigation elements or controls here
      // such as a drawer, bottom navigation bar, floating action button, etc.
    );
  }


}

