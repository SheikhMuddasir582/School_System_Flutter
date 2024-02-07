
import 'package:flutter/material.dart';
import 'package:school_system/view_model/firebase_services/splash_services.dart';


class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashServices splashView= SplashServices();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashView.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Text('School Management System',  style: TextStyle(fontSize: 25, color: Colors.white,),),

      ),
    );
  }
}