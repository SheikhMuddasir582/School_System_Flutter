import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_system/res/components/round_button.dart';
import 'package:school_system/utils/routes/routes_name.dart';



class OfficerView extends StatefulWidget {
  const OfficerView({super.key});

  @override
  State<OfficerView> createState() => _OfficerViewState();
}

final auth= FirebaseAuth.instance;

class _OfficerViewState extends State<OfficerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Officer'),
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 30,),

            RoundButton(
                title: 'Teachers Report',
                onTap: (){
                  Navigator.pushNamed(context, RouteName.teacher);
                }),
                  ],

            // SizedBox(height: 10,),
            //
            // RoundButton(
            //     title: 'Teachers Report',
            //     onTap: (){
            //       Navigator.pushNamed(context, RouteName.teacher);
            //     });
        ),
      ),
    );
  }
}