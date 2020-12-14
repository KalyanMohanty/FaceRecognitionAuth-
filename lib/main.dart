import 'package:FaceNetAuthentication/pages/profile-design.dart';
import 'package:FaceNetAuthentication/pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:FaceNetAuthentication/pages/splash.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:FaceNetAuthentication/pages/admin-registration.dart';
import 'package:FaceNetAuthentication/pages/admin-login.dart';
import 'package:FaceNetAuthentication/pages/admin-pannel.dart';
import 'package:FaceNetAuthentication/pages/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child('admin');

class MyApp extends StatelessWidget {
  // final Future<FirebaseApp> _firebaseAuth = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: Colors.white,
      ),
      // home: Profile(),
      home: SplashScreen(),
      initialRoute: SplashScreen.idScreen,
      routes: {
        RegistrationScreen.idScreen: (context) => RegistrationScreen(),
        AdminLogin.idScreen: (context) => AdminLogin(),
        AdminPannel.idScreen: (context) => AdminPannel(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
