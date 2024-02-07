import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:school_system/utils/routes/routes_name.dart';

class TeacherView extends StatefulWidget {
  const TeacherView({super.key});

  @override
  State<TeacherView> createState() => _TeacherViewState();
}

final auth= FirebaseAuth.instance;


class _TeacherViewState extends State<TeacherView> {

  final databaseRef = FirebaseDatabase.instance.ref('Result');
  final resultControl= TextEditingController();
  final attendanceControl= TextEditingController();
  final auth= FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher'),
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
          Center(child: Text('Employee ID: 101')),
          SizedBox(height: 10,),
          Center(child: Text('Courses Asigned: Mathematics')),
          SizedBox(height: 10,),
          Center(child: Text('Salary: 25000')),
          SizedBox(height: 10,),
          Text('Class Result: 78%'),
          SizedBox(height: 10,),
          Text('Students Attendance: 68%'),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: resultControl,
              decoration: InputDecoration(
                hintText: 'Enter Result',
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'enter attendance';
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: attendanceControl,
              decoration: InputDecoration(
                hintText: 'enter attendance',
                border: OutlineInputBorder(),
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'enter date';
                }
                return null;
              },
            ),
          ),

    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
    children: [
    InkWell(
    onTap: (){
    String id= DateTime.now().millisecondsSinceEpoch.toString();
    //Navigator.push(context, MaterialPageRoute(builder: (context) => MarkScreen()));
    //'id' :    DateTime.now().millisecondsSinceEpoch.toString(),
    //child(DateTime.now().millisecondsSinceEpoch.toString()).set
    databaseRef.child(id).set({
    'result': resultControl.text.toString(),
    'attendance': attendanceControl.text.toString(),
    'id': id,
    }).then((value){
    // Utils().toastMessage1('attendance marked');
    // }).onError((error, stackTrace){
    // Utils().toastMessage(error.toString());
    });

    },
    child: Container(
    height: 50,
    width: 150,
    child: Center(child: Text('Result and Attendance', style: TextStyle(color: Colors.white),)),
    decoration: BoxDecoration(
    color: Colors.teal,
    borderRadius: BorderRadius.circular(10),
    ),
    ),
    ),
    ],
    ),
    ),
        ],
      ),
    );
  }
}
