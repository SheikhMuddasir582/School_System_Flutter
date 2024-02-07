import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_system/utils/routes/routes_name.dart';



class HighView extends StatefulWidget {
  const HighView({super.key});

  @override
  State<HighView> createState() => _HighViewState();
}

final auth= FirebaseAuth.instance;

class _HighViewState extends State<HighView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('High Section Head'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.pushNamed(context, RouteName.login);
            }).onError((error, stackTrace){
              // Utils().toastMessage(error.toString());
            });
          },
            icon: Icon(Icons.logout_outlined),),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10,),
          Center(child: Text('High Teacher Name: Sheikh Haris')),
          SizedBox(height: 10,),
          Center(child: Text('Subject Asigned: Urdu')),
          SizedBox(height: 10,),
          Text('Teachers Attendance: 78%'),
          SizedBox(height: 10,),
          Text('Students Attendance: 68%'),
          SizedBox(height: 10,),
          Text('Students Results: 68%'),
        ],
      )
    );
  }
}