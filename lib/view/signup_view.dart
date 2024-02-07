
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_system/res/components/round_button.dart';
import 'package:school_system/view/home_view.dart';
import 'package:school_system/view/login_view.dart';
import 'package:school_system/view_model/auth_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  bool loading = false;
  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  String role = 'Clerk';
  final DatabaseReference _database = FirebaseDatabase.instance.ref('UserType');
  // final databaseRef = FirebaseDatabase.instance.ref('UserType');

  // String selectedValue = 'Clerk'; // Initially selected value

  // List<String> dropdownItems = [
  //   'Clerk',
  //   'Teacher',
  //   'Primary Head',
  //   'Middle Head',
  //   'High Head',
  //   'Principal',
  //   'District Officer',
  //   'Admin',
  // ];


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControl.dispose();
    passwordControl.dispose();
  }

  void SignUp() async {
    // setState(() {
    //   loading= true;
    // });
    // if(role == snapshot.child('userType').value.toString()) {
    //  print('cannot sigu up');
    // }
    // else{

    //
    // final user= auth.currentUser;
    //
    // bool isClerk = await checkIfTeacherExists(user!.uid);
    //
    // if (isClerk) {
    //   // Display an error message to the user
    //   print("You have already signed up as a teacher.");
    // }
    // else{
    //   _auth.createUserWithEmailAndPassword(
    //       email: emailControl.text.toString(),
    //       password: passwordControl.text.toString()).then((value) {
    //     postDetailsToDatabase(emailControl.text.toString(), role);
    //     // setState(() {
    //     //   loading= false;
    //     // });
    //   }).onError((error, stackTrace) {
    //     // Utils().toastMessage(error.toString());
    //     // Utils().toastMessage(error.toString());
    //     // setState(() {
    //     //   loading= false;
    //     // });
    //   });
    // }


    // final user= auth.currentUser;
    // final databaseRef = FirebaseDatabase.instance.ref('UserType').child(user!.uid).get().then((DataSnapshot snapshot){
    //   // if(snapshot.){
    //     if(snapshot.child('userType').value.toString()== role){
    //       print('cannot signup');
    //       // bool isClerk = await checkIfTeacherExists(user!.uid);
    //     }
    //     else{
    //       _auth.createUserWithEmailAndPassword(
    //           email: emailControl.text.toString(),
    //           password: passwordControl.text.toString()).then((value) {
    //         postDetailsToDatabase(emailControl.text.toString(), role);
    //         // setState(() {
    //         //   loading= false;
    //         // });
    //       }).onError((error, stackTrace) {
    //         // Utils().toastMessage(error.toString());
    //         // Utils().toastMessage(error.toString());
    //         // setState(() {
    //         //   loading= false;
    //         // });
    //       });
    //     }
    //   // }
    // });


    User? user = FirebaseAuth.instance.currentUser;
    var firestore = FirebaseFirestore.instance
        .collection('users')
        .doc()
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        if (documentSnapshot.get('role') == "Teacher") {
         print('cannot sign up user cannot be more then 1');
        }
        else if (documentSnapshot.get('role') == "Clerk") {
          print('cannot sign up user cannot be more then 1');
        }
        else if (documentSnapshot.get('role') == "Principal") {
          print('cannot sign up user cannot be more then 1');
        }
        else if (documentSnapshot.get('role') == "Primary Head") {
          print('cannot sign up user cannot be more then 1');
        }
        else if (documentSnapshot.get('role') == "Middle Head") {
          print('cannot sign up user cannot be more then 1');
        }
        else if (documentSnapshot.get('role') == "High Head") {
          print('cannot sign up user cannot be more then 1');
        }
        else if (documentSnapshot.get('role') == "District Officer") {
          print('cannot sign up user cannot be more then 1');
        }
        else if (documentSnapshot.get('role') == "Admin") {
          print('cannot sign up user cannot be more then 1');
        }
        else{

        }
      } else {
        // print('Document does not exist on the database');
        _auth.createUserWithEmailAndPassword(
            email: emailControl.text.toString(),
            password: passwordControl.text.toString()).then((value) {

          // postDetailsToDatabase(emailControl.text.toString(), role);
          postDetailsToFirestore(emailControl.text.toString(), role);
          // setState(() {
          //   loading= false;
          // });
        }).onError((error, stackTrace) {
          // Utils().toastMessage(error.toString());
          // Utils().toastMessage(error.toString());
          // setState(() {
          //   loading= false;
          // });
        });
      }
    });



    // _auth.createUserWithEmailAndPassword(
    //     email: emailControl.text.toString(),
    //     password: passwordControl.text.toString()).then((value) {
    //
    //   // postDetailsToDatabase(emailControl.text.toString(), role);
    //   postDetailsToFirestore(emailControl.text.toString(), role);
    //   // setState(() {
    //   //   loading= false;
    //   // });
    // }).onError((error, stackTrace) {
    //   // Utils().toastMessage(error.toString());
    //   // Utils().toastMessage(error.toString());
    //   // setState(() {
    //   //   loading= false;
    //   // });
    //   // print('error occured try again');
    //
    // });




  // }

    

  }

  // Future<bool> checkIfTeacherExists(String userId) async {
  //   DataSnapshot snapshot = (await _database.child('userType').child(userId).once() as DataSnapshot) ;
  //   return snapshot.child('userType').value.toString() == role;
  // }

  postDetailsToFirestore(String email, String role) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    String id= DateTime.now().millisecondsSinceEpoch.toString();
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({'email': emailControl.text.toString(), 'role': role, 'id': id});
  }

  // Future<void> postDetailsToDatabase(String email, String role) async{
  //   final databaseRef= FirebaseDatabase.instance.ref('UserType');
  //
  //   String id= DateTime.now().millisecondsSinceEpoch.toString();
  //
  //   var user= _auth.currentUser;
  //   databaseRef.child(user!.uid).set({
  //     'email' : emailControl.text.toString(),
  //     'userType': role,
  //       'id': id,
  //   });
  //
  //   // final authViewModel= Provider.of<AuthViewModel>(context);
  //   // databaseRef.child(id).set({
  //   //   'userType': authViewModel.selectedValue.toString(),
  //   //   'id': id,
  //   // });
  //
  // }


  @override
  Widget build(BuildContext context) {

    final authViewModel= Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
        //automaticallyImplyLeading: false,
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
                    SizedBox(height: 50,),
                  ],
                )),
            SizedBox(height: 10,),

            DropdownButton<String>(
              hint: Text('Select'),
              value: authViewModel.selectedValue,
              onChanged: (String? newValue) async
              {
                authViewModel.setSelectedValue(newValue!);
                 authViewModel.setSelectedRole(newValue);
                 role= authViewModel.role;
                // setState(() {
                //   selectedValue= newValue!;
                // });
                //pref.setString('userType', dropdownValue);
                // SharedPreferences sp= await SharedPreferences.getInstance();
                // // // //dropdownValue= sp.getString('userType') ?? '';
                // sp.setString('userType', authViewModel.selectedValue);

              },
              items: authViewModel.dropdownItems.map<DropdownMenuItem<String>>((String fValue) {
                return DropdownMenuItem<String>(
                  value: fValue,
                  child: Text(fValue),
                );
              }).toList(),
            ),

            RoundButton(title: 'Sign Up',
                loading: loading,
                onTap: () {
                  if (_formkey.currentState!.validate()) {
                    SignUp();
                  }
                }),



            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginView()));
                }, child: Text('Login')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}