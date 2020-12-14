import 'package:flutter/material.dart';
import 'package:FaceNetAuthentication/pages/admin-login.dart';
import 'package:FaceNetAuthentication/pages/complaint-register.dart';
import 'package:FaceNetAuthentication/profile/intern-list-view.dart';
import 'package:FaceNetAuthentication/profile/onboarding-screen.dart';
import 'package:FaceNetAuthentication/pages/profile-design.dart';
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
import 'dashboard-profile.dart';
import 'monthly-report.dart';
import 'package:app_settings/app_settings.dart';
import 'complaint-register.dart';

class Profile extends StatelessWidget {
  const Profile({Key key, @required this.username}) : super(key: key);
  //var now = new DateTime.now();
  final String username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
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
          // IconButton(
          //   icon: Icon(
          //     Icons.present_to_all,
          //     size: 30,
          //   ),
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => CardC()));
          //   },
          // ),
        ],
        backgroundColor: Colors.red[400],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.transparent,
            margin: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.lightBlue,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.access_time_sharp,
                          color: Colors.white,
                          size: 50,
                        ),
                        title: const Text(
                          'Attendance',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        subtitle: Text(
                          'Check your logs',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Attendancelogs(
                                        username: username,
                                      )));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '         Office in | Office out\n         Office in Logs | Office out Logs',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.end,
                      //   children: [
                      //     FlatButton(
                      //       textColor: const Color(0xFF6200EE),
                      //       onPressed: () {
                      //         // Perform some action
                      //       },
                      //       child: const Text('Go'),
                      //     ),
                      //   ],
                      // ),
                      // Image.asset('assets/images/coeai.jpg'),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.lightBlue,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.assignment_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        title: const Text('Reports',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        subtitle: Text(
                          'Get your reports',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MonthlyReport()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '         Daily | Weekly | Monthly report ',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.start,
                      //   children: [
                      //     FlatButton(
                      //       textColor: const Color(0xFF6200EE),
                      //       onPressed: () {
                      //         // Perform some action
                      //       },
                      //       child: const Text('ACTION 1'),
                      //     ),
                      //   ],
                      // ),
                      // Image.asset('assets/images/coeai.jpg'),
                      // Image.asset('assets/images/coeai.jpg'),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.lightBlue,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.account_box_outlined,
                          color: Colors.white,
                          size: 50,
                        ),
                        title: const Text('Team - AI',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        subtitle: Text(
                          'Know your Collegues',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeamAi()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '                 Email | Mobile | System No | Projects',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.start,
                      //   children: [
                      //     FlatButton(
                      //       textColor: const Color(0xFF6200EE),
                      //       onPressed: () {
                      //         // Perform some action
                      //       },
                      //       child: const Text('Go'),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.lightBlue,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.two_wheeler_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        title: const Text('Leaves',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        subtitle: Text(
                          'View applied and remaining leaves',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Leaves()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Applied | Remaing Leaves',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.start,
                      //   children: [
                      //     FlatButton(
                      //       textColor: const Color(0xFF6200EE),
                      //       onPressed: () {
                      //         // Perform some action
                      //       },
                      //       child: const Text('Go'),
                      //     ),
                      //   ],
                      // ),
                      // Image.asset('assets/images/coeai.jpg'),
                      // Image.asset('assets/images/coeai.jpg'),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.lightBlue,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.notification_important,
                            color: Colors.white, size: 50),
                        title: const Text(
                          'Notifications',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        subtitle: Text(
                          'Important Events',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Contactss()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '     Upcomming Events | Notices',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.start,
                      //   children: [
                      //     FlatButton(
                      //       textColor: const Color(0xFF6200EE),
                      //       onPressed: () {
                      //         // Perform some action
                      //       },
                      //       child: const Text('Go'),
                      //     ),
                      //   ],
                      // ),
                      // Image.asset('assets/images/coeai.jpg'),
                      // Image.asset('assets/images/coeai.jpg'),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.lightBlue,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.calendar_view_day_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                        title: const Text('Holiday List',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        subtitle: Text(
                          'Check all the holidays of 2021',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HolidayList()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          '          Govt. Holidays | Local Hollidays',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.start,
                      //   children: [
                      //     FlatButton(
                      //       textColor: const Color(0xFF6200EE),
                      //       onPressed: () {
                      //         // Perform some action
                      //       },
                      //       child: const Text('Go'),
                      //     ),
                      //   ],
                      // ),
                      // Image.asset('assets/images/coeai.jpg'),
                      // Image.asset('assets/images/coeai.jpg'),
                    ],
                  ),
                ),
                Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.lightBlue,
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.help_outline_sharp,
                          color: Colors.white,
                          size: 50,
                        ),
                        title: const Text('Complaint Register',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        subtitle: Text(
                          'Drop issues',
                          style: TextStyle(color: Colors.white),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ComplaintReg()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Register Complaints\nDrop App related issues',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // ButtonBar(
                      //   alignment: MainAxisAlignment.start,
                      //   children: [
                      //     FlatButton(
                      //       textColor: const Color(0xFF6200EE),
                      //       onPressed: () {
                      //         // Perform some action
                      //       },
                      //       child: const Text('ACTION 1'),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
      drawer: Drawer(
        elevation: 20,
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            DrawerHeader(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.red[400],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                '$username',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            SizedBox(height: 1.0),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Mail'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => EMail()));
              },
            ),
            // SizedBox(height: 1.0),
            // ListTile(
            //   leading: Icon(Icons.account_circle),
            //   title: Text('Profile'),
            //   onTap: () {
            //     // Navigator.push(
            //     //     context,
            //     //     MaterialPageRoute(
            //     //         builder: (context) => DashboardProfile(
            //     //               username: username,
            //     //               )));
            //   },
            // ),

            SizedBox(height: 1.0),
            ListTile(
              leading: Icon(Icons.burst_mode),
              title: Text('About COE-AI'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OnboardingScreen()));
              },
            ),
            SizedBox(height: 1.0),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: AppSettings.openAppSettings,
            ),
            SizedBox(height: 1.0),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text('Admin pannel'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminLogin()));
              },
            ),
            // SizedBox(height: 1.0),
            // ListTile(
            //   leading: Icon(Icons.lock),
            //   title: Text('Alternative Dashboard Design'),
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => ProfileDesign(
            //           username: username,
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
