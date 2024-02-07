import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_system/utils/routes/routes.dart';
import 'package:school_system/utils/routes/routes_name.dart';
import 'package:school_system/view_model/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        // ChangeNotifierProvider(create: (_) => AuthViewModel()),
        // ChangeNotifierProvider(create: (_) => UserViewModel()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        initialRoute: RouteName.splashView,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}


