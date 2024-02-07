import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_system/res/components/round_button.dart';
import 'package:school_system/utils/routes/routes_name.dart';



class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

final auth= FirebaseAuth.instance;

class _PrincipalViewState extends State<PrincipalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Principal'),
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
                title: 'Clerk Report',
                onTap: (){
              Navigator.pushNamed(context, RouteName.clerk);
            }),
            SizedBox(height: 10,),

            RoundButton(
                title: 'Teachers Report',
                onTap: (){
                  Navigator.pushNamed(context, RouteName.teacher);
                }),
            SizedBox(height: 10,),

            RoundButton(
                title: 'Primary Head Report',
                onTap: (){
                  Navigator.pushNamed(context, RouteName.primaryHead);
                }),
            SizedBox(height: 10,),

            RoundButton(
                title: 'Middle Head Report',
                onTap: (){
                  Navigator.pushNamed(context, RouteName.middleHead);
                }),
            SizedBox(height: 10,),

            RoundButton(
                title: 'High Head Report',
                onTap: (){
                  Navigator.pushNamed(context, RouteName.highHead);
                }),

          ],
        ),
      )
    );
  }
}
