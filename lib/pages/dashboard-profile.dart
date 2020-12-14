import 'package:flutter/material.dart';
// import 'home.dart';
// import 'profile.dart';
// import 'package:FaceNetAuthentication/pages/performance.dart';
import 'sign-in.dart';

class DashboardProfile extends StatelessWidget {
  const DashboardProfile({Key key, @required this.username}) : super(key: key);
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$username'),
      ),
      body: Container(
          child: Text(username),
          ),
    );
  }
}
