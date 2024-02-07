
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_system/utils/routes/routes_name.dart';
import 'package:school_system/view/Teacher_view.dart';
import 'package:school_system/view/admin_view.dart';
import 'package:school_system/view/clerk_view.dart';
import 'package:school_system/view/high_head.dart';
import 'package:school_system/view/home_view.dart';
import 'package:school_system/view/login_view.dart';
import 'package:school_system/view/middle_head.dart';
import 'package:school_system/view/officer_view.dart';
import 'package:school_system/view/primary_head.dart';
import 'package:school_system/view/principal_view.dart';
import 'package:school_system/view/signup_view.dart';
import 'package:school_system/view/splash_view.dart';


class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings){
    // final argu= settings.arguments;

    switch(settings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
      case RouteName.clerk:
        return MaterialPageRoute(builder: (BuildContext context) => ClerkView());
      case RouteName.teacher:
        return MaterialPageRoute(builder: (BuildContext context) => TeacherView());
      case RouteName.principal:
        return MaterialPageRoute(builder: (BuildContext context) => PrincipalView());
      case RouteName.primaryHead:
        return MaterialPageRoute(builder: (BuildContext context) => PrimaryView());
      case RouteName.middleHead:
        return MaterialPageRoute(builder: (BuildContext context) => MiddleView());
      case RouteName.highHead:
        return MaterialPageRoute(builder: (BuildContext context) => HighView());
      case RouteName.admin:
        return MaterialPageRoute(builder: (BuildContext context) => AdminView());
      case RouteName.districtOfficer:
        return MaterialPageRoute(builder: (BuildContext context) => OfficerView());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginView());
      case RouteName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => SignUpView());
      case RouteName.splashView:
        return MaterialPageRoute(builder: (BuildContext context) => SplashView());
      default:
        return MaterialPageRoute(builder: (_){
          return Scaffold(
            body: Center(
              child:Text('No Route Defined'),
            ),
          );
        });
    }
  }
}