import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_system/utils/routes/routes_name.dart';



class ClerkView extends StatefulWidget {
  const ClerkView({super.key});

  @override
  State<ClerkView> createState() => _ClerkViewState();
}

final auth= FirebaseAuth.instance;

class _ClerkViewState extends State<ClerkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clerk'),
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
          Center(child: Text('Teacher Name: Sheikh Umer')),
          SizedBox(height: 10,),
          Center(child: Text('32576-2689192-5')),
          SizedBox(height: 10,),
          Center(child: Text('Teacher Name: Sheikh Ali')),
          SizedBox(height: 10,),
          Center(child: Text('32576-2689192-5')),
          SizedBox(height: 10,),
          Center(child: Text('Teacher Attendance: Sheikh Umer = 89%')),
          SizedBox(height: 10,),
          Center(child: Text('Principal Attendance: Sheikh ALi = 67%')),
          SizedBox(height: 10,),
          Center(child: Text('Teacher Leave Record: Sheikh Umer = 7')),
          SizedBox(height: 10,),
          Center(child: Text('Principal Leave Record: Sheikh ALi = 2')),
          SizedBox(height: 10,),
          Center(child: Text('Subject detail: Mathematics')),
          SizedBox(height: 10,),
          Center(child: Text('Student Details: Abdullah')),


        ],
      )
    );
  }
}
