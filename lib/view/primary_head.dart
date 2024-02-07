import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_system/utils/routes/routes_name.dart';



class PrimaryView extends StatefulWidget {
  const PrimaryView({super.key});

  @override
  State<PrimaryView> createState() => _PrimaryViewState();
}

final auth= FirebaseAuth.instance;

class _PrimaryViewState extends State<PrimaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primary Section Head'),
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
          Center(child: Text('Primary Teacher Name: Sheikh Umer')),
          SizedBox(height: 10,),
          Center(child: Text('Subject Asigned: Mathematics')),
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
