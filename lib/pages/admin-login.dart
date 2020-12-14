import 'package:FaceNetAuthentication/pages/admin-pannel.dart';
import 'package:flutter/material.dart';
import 'admin-registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'forgotpassword.dart';
import 'admin-registration.dart';
import 'dashboard-profile.dart';
import 'holidaylist.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(AdminLogin());
// }
void main() {
  runApp(AdminLogin());
}

// DatabaseReference userRef =
//     FirebaseDatabase.instance.reference().child('admin');

class AdminLogin extends StatelessWidget {
  static const String idScreen = 'login';
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 35.0,
              ),
              Image(
                image: AssetImage('assets/images/office2.jpg'),
                width: 390.0,
                height: 250.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Text(
                'Admin Login',
                style: TextStyle(fontSize: 24.0, fontFamily: 'Brand Bold'),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'password',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(height: 20.0),
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: 'Brand Bold'),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0)),
                      onPressed: () {
                        if (!emailTextEditingController.text
                            .contains('@cet.edu.in')) {
                          displayToastMessage(
                              'Enter correct Email address', context);
                        } else if (passwordTextEditingController.text.isEmpty) {
                          displayToastMessage('password is mandatory', context);
                        } else {
                          loginAndAuthenticateUser(context);
                        }
                      },
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Text('Forgot Passowrd?'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                child: Text('Do not have an Account? Register here.'),
              )
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void loginAndAuthenticateUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage('Error' + errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      userRef.child(firebaseUser.uid).once().then((DataSnapshot snap) {
        if (snap.value != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AdminPannel()));
          displayToastMessage('Successfully logged-in', context);
        } else {
          _firebaseAuth.signOut();
          displayToastMessage(
              'No record found. Please create new account', context);
        }
      });
      Navigator.pushNamedAndRemoveUntil(
          context, AdminPannel.idScreen, (route) => false);
    } else {
      displayToastMessage('Error occured', context);
    }
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}
