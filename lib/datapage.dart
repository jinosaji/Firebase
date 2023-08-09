import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectfire/login.dart';
import 'package:projectfire/register.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'ui page/Home.dart';

class Data extends StatefulWidget {
  const  Data({Key? key}) : super(key: key);

  @override
  State< Data> createState() => _DataState();
}
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController confirmpasswordController = TextEditingController();

late String selectedgroup;
final CollectionReference users =
FirebaseFirestore.instance.collection('users');
void adddonor() {
  final data = {
    'name': name.text,
    'phone': phone.text,
    'age': age.text,
  };
  users.add(data);
}
TextEditingController name = TextEditingController();
TextEditingController phone = TextEditingController();
TextEditingController age = TextEditingController();




//sign in using email and pass

Future signinuser(context) async {
  final password =  phoneController.text;
  final confirmpassword = confirmpasswordController.text;
  if (password == confirmpassword) {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: nameController.text.trim(),
        password: confirmpasswordController.text.trim(),
      );
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyApp()));
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 2, 192, 72),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text('Account Successfully Created ')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          duration: Duration(seconds: 3),
          backgroundColor: Color.fromARGB(255, 238, 103, 94),
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10.0),
          content: Text('Try Again ')));
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromARGB(255, 238, 103, 94),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10.0),
        content: Text('Password Doesnot Match')));
  }
}
class _DataState extends State< Data> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => HomePage(),
      },
      home:

// Add namecontroller&passwordController



 Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Data page',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter Your Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                controller: age,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Age',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  adddonor();
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>register()));
                   // Pass the context to the function.

                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Already have an account?'),
                TextButton(
                  child: const Text(
                    'login',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {

                    //navigator route

                    Navigator.push(context, MaterialPageRoute(builder:(context)=>register()));
                    // signup screen
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    ));
  }
}