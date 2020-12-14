import 'package:FaceNetAuthentication/pages/admin-login.dart';
import 'package:FaceNetAuthentication/pages/complaint-register.dart';
import 'package:FaceNetAuthentication/pages/profile-user-dashoard.dart';
import 'package:FaceNetAuthentication/profile/onboarding-screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'admin-pannel.dart';
import 'attendance-logs.dart';
import 'mail.dart';
import 'home.dart';
import 'announcements-admin.dart';
import 'intern-directory-user.dart';
import 'leaves.dart';
import 'holidaylist.dart';
import 'about-coeai.dart';
import 'package:FaceNetAuthentication/pages/profile.dart';
import 'monthly-report.dart';
import 'package:app_settings/app_settings.dart';
import 'complaint-register.dart';
import 'package:FaceNetAuthentication/profile/intern-list-view.dart';

class ProfileDesign extends StatelessWidget {
  const ProfileDesign({Key key, @required this.username}) : super(key: key);
  //var now = new DateTime.now();
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.power_settings_new_rounded,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyHomePage()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => OnboardingScreen()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.precision_manufacturing_outlined,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => TeamAi()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.present_to_all,
              size: 30,
            ),
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => CardC()));
            },
          ),
        ],
        backgroundColor: Colors.blue[800],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            // margin: EdgeInsets.all(3),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.zero,
                  // color: Colors.blue,
                  child: Text(
                    'Photo Gallery',
                    style: TextStyle(fontSize: 24.0, fontFamily: 'Brand Bold'),
                    textAlign: TextAlign.start,
                  ),
                ),
                Container(
                  margin: EdgeInsets.zero,
                  color: Colors.white,
                  height: 200,
                  width: 400,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        child: Image(
                          image: AssetImage('assets/images/photo.jpg'),
                          width: 200,
                          height: 100,
                          // alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        child: Image(
                          image: AssetImage('assets/images/photo1.jpg'),
                          width: 200,
                          height: 100,
                          // alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        child: Image(
                          image: AssetImage('assets/images/photo2.jpg'),
                          width: 200,
                          height: 100,
                          // alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        child: Image(
                          image: AssetImage('assets/images/photo3.jpg'),
                          width: 200,
                          height: 100,
                          // alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        child: Image(
                          image: AssetImage('assets/images/photo4.jpg'),
                          width: 200,
                          height: 100,
                          // alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(10),
                        height: 30,
                        child: Image(
                          image: AssetImage('assets/images/photo5.jpg'),
                          width: 200,
                          height: 100,
                          // alignment: Alignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Container(
                      //margin: EdgeInsets.all(5),
                      height: 50.0,
                      width: 300,
                      child: Center(
                        child: Text(
                          'Attendance Logs',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand Bold'),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Attendancelogs(
                                    username: username,
                                  )));
                    },
                  ),
                ),
                Container(
                  height: 5,
                ),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Container(
                      // margin: EdgeInsets.all(5),
                      height: 50.0,
                      width: 300,
                      child: Center(
                        child: Text(
                          'Monthly Report',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand Bold'),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MonthlyReport()));
                    },
                  ),
                ),
                Container(
                  height: 5,
                ),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Container(
                      // margin: EdgeInsets.all(5),
                      height: 50.0,
                      width: 300,
                      child: Center(
                        child: Text(
                          'Interns',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand Bold'),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InternDirUser()));
                    },
                  ),
                ),
                Container(
                  height: 5,
                ),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Container(
                      // margin: EdgeInsets.all(5),
                      height: 50.0,
                      width: 300,
                      child: Center(
                        child: Text(
                          'Leaves',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand Bold'),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Leaves()));
                    },
                  ),
                ),
                Container(
                  height: 5,
                ),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Container(
                      // margin: EdgeInsets.all(5),
                      height: 50.0,
                      width: 300,
                      child: Center(
                        child: Text(
                          'Notifications',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand Bold'),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contactss()));
                    },
                  ),
                ),
                Container(
                  height: 5,
                ),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Container(
                      // margin: EdgeInsets.all(5),
                      height: 50.0,
                      width: 300,
                      child: Center(
                        child: Text(
                          'Holiday List',
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand Bold'),
                        ),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HolidayList()));
                    },
                  ),
                ),
                Container(
                  height: 5,
                ),
                Container(
                  child: RaisedButton(
                    elevation: 8,
                    color: Colors.blue,
                    textColor: Colors.white,
                    child: Container(
                      // margin: EdgeInsets.all(5),
                      height: 50.0,
                      width: 300,
                      child: Center(
                        child: Text(
                          'Complaint Register',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18.0, fontFamily: 'Brand Bold'),
                        ),
                        // Icon(Icons.send)
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ComplaintReg()));
                    },
                  ),
                ),
                // Container(
                //   child: RaisedButton.icon(
                //     elevation: 4.0,
                //     icon: Image.asset(
                //       'assets/images/coeai.jpg',
                //       width: 20,
                //       height: 20,
                //     ),
                //     color: Theme.of(context).primaryColor,
                //     onPressed: () {},
                //     label: Text(
                //       "Add Team Image",
                //       style: TextStyle(color: Colors.white, fontSize: 16.0),
                //     ),
                //     shape: new RoundedRectangleBorder(
                //         borderRadius: new BorderRadius.circular(24.0)),
                //   ),
                // ),
                Container(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      drawer: Drawer(
        elevation: 10,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue[800],
              ),
              child: Text(
                '$username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mail'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => EMail()));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: AppSettings.openAppSettings,
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward),
              title: Text('About COE-AI'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyAppp()));
              },
            ),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Admin pannel'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminLogin()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
