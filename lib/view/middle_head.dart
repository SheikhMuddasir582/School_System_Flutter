import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_system/utils/routes/routes_name.dart';



class MiddleView extends StatefulWidget {
  const MiddleView({super.key});

  @override
  State<MiddleView> createState() => _MiddleViewState();
}

final auth= FirebaseAuth.instance;

class _MiddleViewState extends State<MiddleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Middle Section Head'),
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
          Center(child: Text('Middle Teacher Name: Sheikh Moiz')),
          SizedBox(height: 10,),
          Center(child: Text('Subject Asigned: Accounting')),
          SizedBox(height: 10,),
          Text('Teachers Attendance: 78%'),
          SizedBox(height: 10,),
          Text('Students Attendance: 68%'),
          SizedBox(height: 10,),
          Text('Students Results: 68%'),
        ],
      ),
    );
  }
}