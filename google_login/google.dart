import 'package:firebase/google_login/User_detail.dart';
import 'package:firebase/google_login/home.dart';
import 'package:firebase/login_logout/homepage.dart';
import 'package:firebase/login_logout/login.dart';
import 'package:firebase/login_logout/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{

        "/homepage":(BuildContext context)=>home(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text("fluutter container"),

      ),

      body:
      ElevatedButton(
        onPressed: () {
          Signinwithgoogle().then((value)
          {
            FirebaseFirestore.instance.collection("users").doc("google").collection("user1").add(
                {"name": name,
                  "email" : email,
                  "photourl" : photourl,});
          }
          ).catchError((e){
            print(e);
          }).then((value)
          {
            Navigator.pushNamed(context, "/homepage");
          }
          );
        },
        child: Text("login please"),),
    );
  }

}