
import 'package:projectfire/datapage.dart';

import 'phone.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'forgort.dart';

import 'ui page/Home.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
// login page add all

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
// add namecontroller&password

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

Future<void> signInUser(BuildContext context) async {
  print(nameController.text.trim());
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: nameController.text.trim(),
      password: passwordController.text.trim(),
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
  } on FirebaseAuthException catch (e) {
    print(e);
    final error ='Email and password not match';
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error),
          duration:Duration(seconds: 3) ,
          backgroundColor: Colors.red,
        )

    );
  }
}
// google ayitt sign cheyan ee code use cheyunnu
// ethil GoogleSignIn() enn mathre kanath ullu athilek clientId enn type cheyuka
// annitt google services.json ill ninn clientid copy cheyith paste cheyuka
signInWithGoogle(context) async {
 try {
   final GoogleSignInAccount? guser = await GoogleSignIn(clientId:"621819653033-fbmdhve4n661j3g5fn8ifh41cv83jqai.apps.googleusercontent.com")

       .signIn();
   final GoogleSignInAuthentication gauth = await guser!.authentication;
   final credential = GoogleAuthProvider.credential(
     idToken: gauth.idToken,
     accessToken: gauth.accessToken,
   );
   await FirebaseAuth.instance.signInWithCredential(credential);
   // next page varan vilikkuka
   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
 } catch(e){
   print("hyyyyyyyyyyyyyyyyyyy $e");
   ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(content: Text(e.toString()),
         duration:Duration(seconds: 3) ,
         backgroundColor: Colors.red,
       )

   );
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
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>forget()));
                //forgot password screen
              },
              child: const Text('Forgot Password'),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () {
                  signInUser(context); // Pass the context to the function.

                },
              ),
            ),
            Row(
              children: <Widget>[
                const Text('Does not have an account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    // navigator button
                    Navigator.push(context, MaterialPageRoute(builder:(context)=>Data()));
                    //
                    // signup screen

                  },
                ),
              ],

              mainAxisAlignment: MainAxisAlignment.center,
            ),
            //google service flie create cheyith kazhij  signin button create
            // cheyanm athin pubspec. ill sign_in_button add (terminal-flutter pub get flutter_signin_button)

            TextButton(
              child: const Text(
                'Phone',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                // navigator button
                Navigator.push(context, MaterialPageRoute(builder:(context)=>LoginScreen()));
                //
                // signup screen

              },
            ),

          ],
        ),
      ),
    );
  }
}