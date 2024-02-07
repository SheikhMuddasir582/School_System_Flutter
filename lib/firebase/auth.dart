import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:school_system/utils/routes/routes_name.dart';
import 'package:school_system/view/home_view.dart';


class MyFireBaseAuth{

  final _auth= FirebaseAuth.instance;
  final emailControl= TextEditingController();
  final passwordControl= TextEditingController();

  Future<void> login(BuildContext context) async{
    await _auth.signInWithEmailAndPassword(email: emailControl.text.toString(),
        password: passwordControl.text.toString()).then((value){
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
      // Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreMark()));
      Navigator.pushNamed(context, RouteName.home);

    }).onError((error, stackTrace){
      debugPrint(error.toString());
    });
  }

}

