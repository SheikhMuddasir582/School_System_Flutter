

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_system/firebase/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier{

  final _myAuth= MyFireBaseAuth();
  final _auth= FirebaseAuth.instance;

  bool _loading= false;
  bool get loading => _loading;

  String _selectedValue= 'Clerk';
  String get  selectedValue => _selectedValue;

  String _role= 'Clerk';
  String get  role => _role;

  setSelectedValue(String value){

    _selectedValue= value;

    notifyListeners();

  }

  setSelectedRole(String value){

    _role= value;

    notifyListeners();

  }

  List<String> dropdownItems = [
    'Clerk',
    'Teacher',
    'Primary Head',
    'Middle Head',
    'High Head',
    'Principal',
    'District Officer',
    'Admin',
  ];

  // Future<bool> saveUser () async{
  //   final SharedPreferences sp= await SharedPreferences.getInstance();
  //   sp.setString('userType', selectedValue);
  //
  //
  //   return true;
  //
  // }

  setLoading(bool value){
    _loading= value;
    notifyListeners();
  }

  Future<void> authData(BuildContext context) async{
    await _myAuth.login(context);

  }
}