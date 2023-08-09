import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectfire/login.dart';
// add TextEditingController nameController = TextEditingController();
TextEditingController nameController = TextEditingController();
Future resetpassword(context) async {
  final email =nameController.text;
  if (email.contains('@')) {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromARGB(255, 6, 157, 21),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10.0),
        content: Text('Reset Email has been send to $email')));

    // change Navigator (  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));)

    Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Color.fromARGB(255, 238, 103, 94),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(10.0),
        content: Text('Enter correct Email')));
  }
}
// add class[stless]
class forget extends StatefulWidget {
  const forget({super.key});

  @override
  State<forget> createState() => _forgetState();
}

class _forgetState extends State<forget> {
  @override
  Widget build(BuildContext context) {

    //Add Sccaffold items

    return Scaffold
      ( body: Padding(
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
            labelText: 'email',
     ),
      ),
        ),
                   Container(
                height: 50,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
           child: ElevatedButton(
             child: const Text('reset'),
           onPressed: () {
                  resetpassword(context); // Pass the context to the function.
                 }
               ),
             )
              ],
             ),
          ),
         );

  }
}
