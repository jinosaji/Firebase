import 'package:flutter/material.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';

//firebase code [main.dart]
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCb2Fdrbu41tFW3rdtm9oH1nlnzH5EwVPU",
      appId: "1:621819653033:android:d9e7464e28d0f9264572b8",
      messagingSenderId: "621819653033",
      projectId: "fir-c6d41",
    ),
  );
  runApp(const MyApp());
}
