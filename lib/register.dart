import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectfire/login.dart';
import 'package:sign_in_button/sign_in_button.dart';


import 'ui page/Home.dart';

class register extends StatefulWidget {
  const  register({Key? key}) : super(key: key);

  @override
  State< register> createState() => _registerState();
}

class _registerState extends State< register> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => HomePage(),
      },
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

// Add namecontroller&passwordController

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmpasswordController = TextEditingController();

//sign in using email and pass

Future signinuser(context) async {
  final password =  passwordController.text;
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

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Firebase',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: confirmpasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'confirm Password',
                ),
              ),
            ),
        Container(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('signin'),
                onPressed: () {
                  signinuser(context); // Pass the context to the function.

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

                    Navigator.push(context, MaterialPageRoute(builder:(context)=>MyApp()));
                    // signup screen
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SignInButton(Buttons.google, onPressed:(){
              signInWithGoogle(context);
            }
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: SignInButton(Buttons.apple,onPressed: (){
                signInWithGoogle(context);
              },),
            ),
          Padding(
          padding: const EdgeInsets.all(8.0),
      child: Container(
        child: SignInButton(
          Buttons.twitter,
          onPressed: () {},
        ),
      ),
          ),
          ],
          
        ),
      ),
    );
  }
}