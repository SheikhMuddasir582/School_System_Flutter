


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:school_system/res/components/round_button.dart';
import 'package:school_system/utils/routes/routes_name.dart';
import 'package:school_system/view/teacher_view.dart';
import 'package:school_system/view/home_view.dart';
import 'package:school_system/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailControl= TextEditingController();
  final passwordControl= TextEditingController();
  final _formkey= GlobalKey<FormState>();
  bool loading= false;
  final _auth= FirebaseAuth.instance;
  final databaseRef= FirebaseDatabase.instance.ref('UserType');


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControl.dispose();
    passwordControl.dispose();
  }

 void login(){
    // setState(() {
    //   loading= true;
    // });
    _auth.signInWithEmailAndPassword(email: emailControl.text.toString(),
        password: passwordControl.text.toString()).then((value) async{
      // Utils().toastMessage1(value.user!.email.toString());
      // SharedPreferences sp= await SharedPreferences.getInstance();
      // sp.getString('userType');
      route();

      // final authViewModel= Provider.of<AuthViewModel>(context, listen: false);
      // if(authViewModel.selectedValue.contains('Teacher')){
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherView()));
      // }
      // else{
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
      // }
      // if(databaseRef.child('userType') == 'Middle Head')
      //   {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => TeacherView()));
      //   }
      //
      // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));

      // Navigator.push(context, MaterialPageRoute(builder: (context) => FireStoreMark()));
      // setState(() {
      //   loading= false;
      // });

    }).onError((error, stackTrace){
      debugPrint(error.toString());
      // Utils().toastMessage(error.toString());
      // setState(() {
      //   loading= false;
      // });
    });
  }

  // void route(){
  //   User? user= FirebaseAuth.instance.currentUser;
  //   var dataref= FirebaseDatabase.instance.ref('UserType').child(user!.uid).get().then(( DataSnapshot snapshot){
  //     if(snapshot.exists){
  //       if(snapshot.child('userType').value.toString() == 'Clerk'){
  //        Navigator.pushNamed(context, RouteName.clerk);
  //       }
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
  //     }
  //     // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
  //   });
  // }

  void route() {
    User? user = FirebaseAuth.instance.currentUser;
    var firestore = FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Teacher") {
          Navigator.pushNamed(context, RouteName.teacher);
        }
        else if (documentSnapshot.get('role') == "Clerk") {
          Navigator.pushNamed(context, RouteName.clerk);
        }
        else if (documentSnapshot.get('role') == "Principal") {
          Navigator.pushNamed(context, RouteName.principal);
        }
        else if (documentSnapshot.get('role') == "Primary Head") {
          Navigator.pushNamed(context, RouteName.primaryHead);
        }
        else if (documentSnapshot.get('role') == "Middle Head") {
          Navigator.pushNamed(context, RouteName.middleHead);
        }
        else if (documentSnapshot.get('role') == "High Head") {
          Navigator.pushNamed(context, RouteName.highHead);
        }
        else if (documentSnapshot.get('role') == "Admin") {
          Navigator.pushNamed(context, RouteName.admin);
        }
        else if (documentSnapshot.get('role') == "District Officer") {
          Navigator.pushNamed(context, RouteName.districtOfficer);
        }
        else{
          Navigator.pushNamed(context, RouteName.home);
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel= Provider.of<AuthViewModel>(context);
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('login'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailControl,
                        decoration: InputDecoration(
                          hintText: 'Email',

                          prefixIcon: const Icon(
                            Icons.alternate_email,
                            color: Color(0xff323F4B),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'enter email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: passwordControl,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'password',
                          prefixIcon: const Icon(
                            Icons.lock_open,
                            color: Color(0xff323F4B),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffE4E7EB)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return 'enter password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 30,),
                    ],
                  )),
              RoundButton(title: 'Login',
                loading: authViewModel.loading,
                onTap: (){
                  if(_formkey.currentState!.validate()){
                    // authViewModel.authData(emailControl.text.toString(), passwordControl.text.toString(),

                        //context);
                    login();
                    // authViewModel.authData(context);
                    print('hello');
                  }
                },
              ),
              // Align(
              //   alignment: Alignment.bottomRight,
              //   child: TextButton(onPressed: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen()));
              //   }, child: Text('Forget Password?', style: TextStyle(decoration: TextDecoration.underline),)),
              // ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, RouteName.signUp);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpView()));
                  }, child: Text('sign up')),
                ],
              ),
              SizedBox(height: 30,),
              // InkWell(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPhoneNummber()));
              //   },
              //   child: Container(
              //     height: 50,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(50),
              //         border: Border.all(
              //           color: Colors.black,
              //         )
              //     ),
              //     child: Center(
              //       child: Text('Login with Phone'),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}