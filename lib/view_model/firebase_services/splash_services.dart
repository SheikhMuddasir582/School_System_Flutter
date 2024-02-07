import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:school_system/utils/routes/routes_name.dart';
class SplashServices{
  void isLogin(BuildContext context){
    final auth= FirebaseAuth.instance;
    final user= auth.currentUser;

    // final dbRef= FirebaseDatabase.instance.ref('UserType').get();
    // DataSnapshot snapshot=  FirebaseDatabase.instance.ref('UserType').get() as DataSnapshot;

    // if(user !=null){
    //   // Timer(const Duration(seconds: 3), () =>Navigator.pushNamed(context, RouteName.primaryHead),);
    //   var dataref= FirebaseDatabase.instance.ref('UserType').child(user!.uid).get().then(( DataSnapshot snapshot){
    //     if(snapshot.value != null){
    //
    //       if(snapshot.child('userType').value.toString() == 'Clerk') {
    //         Navigator.pushNamed(context, RouteName.clerk);
    //       }
    //
    //       else if(snapshot.child('userType').value.toString() == 'Teacher'){
    //         Navigator.pushNamed(context, RouteName.teacher);
    //       }
    //       else if(snapshot.child('userType').value.toString() == 'Principal'){
    //         Navigator.pushNamed(context, RouteName.principal);
    //       }
    //       else if(snapshot.child('userType').value.toString() == 'Primary Head'){
    //         Navigator.pushNamed(context, RouteName.primaryHead);
    //       }
    //       else if(snapshot.child('userType').value.toString() == 'Middle Head'){
    //         Navigator.pushNamed(context, RouteName.middleHead);
    //       }
    //       else if(snapshot.child('userType').value.toString() == 'High Head'){
    //         Navigator.pushNamed(context, RouteName.highHead);
    //       }
    //       else if(snapshot.child('userType').value.toString() == 'District Officer'){
    //         Navigator.pushNamed(context, RouteName.districtOfficer);
    //       }
    //       else if(snapshot.child('userType').value.toString() == 'Admin'){
    //         Navigator.pushNamed(context, RouteName.admin);
    //       }
    //       else{
    //         Navigator.pushNamed(context, RouteName.home);
    //       }
    //       //
    //       //
    //       //
    //       //     // if(snapshot.child('userType').value.toString() == 'Clerk'){
    //       //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
    //       //     // }
    //       //     // else{
    //       //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
    //       //     // }
    //       //   }
    //       //
    //       //
    //       //   // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
    //     }
    //     else{
    //       Navigator.pushNamed(context, RouteName.login);
    //     }
    //     // Navigator.pushNamed(context, RouteName.login);
    //   });
    // }
    // else
    // {
    //   // Timer(const Duration(seconds: 3), () =>Navigator.pushNamed(context, RouteName.login),);
    //   Navigator.pushNamed(context, RouteName.login);
    // }



   // var dataref= FirebaseDatabase.instance.ref('UserType').child(user!.uid).get().then(( DataSnapshot snapshot){
   //    if(snapshot.value != null){
   //
   //      if(snapshot.child('userType').value.toString() == 'Clerk'){
   //        Navigator.pushNamed(context, RouteName.clerk);
   //      }
   //      else if(snapshot.child('userType').value.toString() == 'Teacher'){
   //        Navigator.pushNamed(context, RouteName.teacher);
   //      }
   //      else if(snapshot.child('userType').value.toString() == 'Principal'){
   //        Navigator.pushNamed(context, RouteName.principal);
   //      }
   //      else if(snapshot.child('userType').value.toString() == 'Primary Head'){
   //        Navigator.pushNamed(context, RouteName.primaryHead);
   //      }
   //      else if(snapshot.child('userType').value.toString() == 'Middle Head'){
   //        Navigator.pushNamed(context, RouteName.middleHead);
   //      }
   //      else if(snapshot.child('userType').value.toString() == 'High Head'){
   //        Navigator.pushNamed(context, RouteName.highHead);
   //      }
   //      else if(snapshot.child('userType').value.toString() == 'District Officer'){
   //        Navigator.pushNamed(context, RouteName.districtOfficer);
   //      }
   //      else if(snapshot.child('userType').value.toString() == 'Admin'){
   //        Navigator.pushNamed(context, RouteName.admin);
   //      }
   //      else{
   //        Navigator.pushNamed(context, RouteName.home);
   //      }
   //  //
   //  //
   //  //
   //  //     // if(snapshot.child('userType').value.toString() == 'Clerk'){
   //  //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
   //  //     // }
   //  //     // else{
   //  //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
   //  //     // }
   //  //   }
   //  //
   //  //
   //  //   // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
   //  }
   //    else{
   //      Navigator.pushNamed(context, RouteName.login);
   //    }
   //    // Navigator.pushNamed(context, RouteName.login);
   //  });


    // Navigator.pushNamed(context, RouteName.login);



    // if(databaseRef.child(user.uid).get().then((DataSnapshot snapshot){
    //
    // }));
    // {
    //   if(snapshot.child('userType').value.toString() == 'Clerk'){
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherView()));
    //   }
    //   else{
    //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
    //   }
    // }

    if(user != null){
      // Timer(const Duration(seconds: 3), () =>Navigator.pushNamed(context, RouteName.primaryHead),);
      User? user = FirebaseAuth.instance.currentUser;
      var firestore = FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          if (documentSnapshot.get('role') == "Teacher") {
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.teacher),);
          }
          else if (documentSnapshot.get('role') == "Clerk") {
            Timer(const Duration(seconds: 3), () =>  Navigator.pushNamed(context, RouteName.clerk),);
          }
          else if (documentSnapshot.get('role') == "Principal") {
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.principal),);
          }
          else if (documentSnapshot.get('role') == "Primary Head") {
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.primaryHead),);
          }
          else if (documentSnapshot.get('role') == "Middle Head") {
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.middleHead),);
          }
          else if (documentSnapshot.get('role') == "High Head") {
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.highHead),);
          }
          else if (documentSnapshot.get('role') == "Admin") {
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.admin),);
          }
          else if (documentSnapshot.get('role') == "District Officer") {
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.districtOfficer),);
          }
          else{
            Timer(const Duration(seconds: 3), () => Navigator.pushNamed(context, RouteName.home),);
          }
        } else {

          print('Document does not exist on the database');
          Timer(const Duration(seconds: 3), () =>Navigator.pushNamed(context, RouteName.login),);
        }
      });
    }
    else
    {
      Timer(const Duration(seconds: 3), () =>Navigator.pushNamed(context, RouteName.login),);
    }
  }


  // void isLogin(BuildContext context) {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   if(user != null){
  //     var firestore = FirebaseFirestore.instance
  //         .collection('users').doc().get()
  //         .then((DocumentSnapshot documentSnapshot) {
  //       if (documentSnapshot.exists) {
  //         if (documentSnapshot.get('role') == "Teacher") {
  //           Navigator.pushNamed(context, RouteName.teacher);
  //         }
  //         else{
  //           Navigator.pushNamed(context, RouteName.home);
  //         }
  //       }
  //       else {
  //         print('Document does not exist on the database');
  //       }
  //     });
  //   }
  //   else{
  //     Navigator.pushNamed(context, RouteName.home);
  //   }
  // }
}