import 'package:FaceNetAuthentication/pages/admin-pannel.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'admin-login.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(RegistrationScreen());
// // }
void main() {
  runApp(RegistrationScreen());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child('admin');

class RegistrationScreen extends StatelessWidget {
  static const String idScreen = 'register';
  final nameTextEditingController = TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
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
                height: 28.0,
              ),
              Image(
                image: AssetImage('assets/images/office.jpg'),
                width: 390,
                height: 250,
                alignment: Alignment.center,
              ),
              SizedBox(height: 1.0),
              Text(
                'Register as Admin',
                style: TextStyle(fontSize: 24.0, fontFamily: 'Brand Bold'),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: nameTextEditingController,
                      //keyboardType: TextInputType.test,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    TextField(
                      //keyboardType: TextInputType.test,
                      controller: emailTextEditingController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    TextField(
                      //keyboardType: TextInputType.test,
                      controller: phoneTextEditingController,
                      decoration: InputDecoration(
                        labelText: 'Phone',
                        labelStyle: TextStyle(fontSize: 14),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    TextField(
                      //keyboardType: TextInputType.test,
                      controller: passwordTextEditingController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 14),
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
                            'Create account',
                            style: TextStyle(
                                fontSize: 18.0, fontFamily: 'Brand Bold'),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(24.0)),
                      onPressed: () {
                        if (nameTextEditingController.text.length < 4) {
                          displayToastMessage(
                              'Name Must be atleast 4 characters', context);
                        } else if (!emailTextEditingController.text
                            .contains('@cet.edu.in')) {
                          displayToastMessage(
                              'Enter correct Email address', context);
                        } else if (phoneTextEditingController.text.isEmpty) {
                          displayToastMessage(
                              'phone Number is mandatory', context);
                        } else if (passwordTextEditingController.text.length <
                            6) {
                          displayToastMessage(
                              'password must be atleast 6 characters', context);
                        } else {
                          registerNewUser(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
              FlatButton(
                child: Text('Already have an Account? Login Here'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminLogin()));
                },
              ),
              // FloatingActionButton(
              //   child: ,
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      displayToastMessage('Error' + errMsg.toString(), context);
    }))
        .user;
    if (firebaseUser != null) {
      //save user in databse

      Map userDataMap = {
        'name': nameTextEditingController.text.trim(),
        'email': emailTextEditingController.text.trim(),
        'phone': phoneTextEditingController.text.trim(),
      };
      userRef.child(firebaseUser.uid).set(userDataMap);
      displayToastMessage(
          'Congratulations, your account has  been createed', context);
      Navigator.pushNamedAndRemoveUntil(
          context, AdminLogin.idScreen, (route) => true);
    } else {
      //error occured-display error message
      displayToastMessage('User Account has been created', context);
    }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
