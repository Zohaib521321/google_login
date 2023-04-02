import 'package:flutter/material.dart';
import 'package:firebase/google_login/User_detail.dart';
import 'package:google_sign_in/google_sign_in.dart';
class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
logout();
Navigator.pop(context);

          },
        child: Text("Signout"),
        ),
      ),
    );
  }
}
