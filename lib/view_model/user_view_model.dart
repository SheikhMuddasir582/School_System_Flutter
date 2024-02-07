
// import 'package:flutter/material.dart';
// import 'package:school_system/view_model/auth_view_model.dart';
//
// class UserViewModel with ChangeNotifier{
//
//   Future<bool> saveUser () async{
//     final SharedPreferences sp= await SharedPreferences.getInstance();
//     sp.setString('token', user.token.toString());
//
//
//     return true;
//
//   }

//   Future<UserModel> getUser() async{
//     final SharedPreferences sp= await SharedPreferences.getInstance();
//     final String? token= sp.getString('token');
//
//     return UserModel(
//       token: token.toString(),
//     );
//   }
//
//   Future<bool> remove() async{
//     final SharedPreferences sp= await SharedPreferences.getInstance();
//     // sp.clear();
//     sp.remove('token');
//     // return sp.clear();
//     return true;
//   }
//
// }