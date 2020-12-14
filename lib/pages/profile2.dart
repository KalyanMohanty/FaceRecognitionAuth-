import 'package:FaceNetAuthentication/pages/admin-login.dart';
import 'package:FaceNetAuthentication/pages/complaint-register.dart';
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
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(Icons.more_vert),
        //   )
        // ],
      ),
      body: ListView(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 150,
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: ListTile(
              leading: Icon(
                Icons.access_time_sharp,
                color: Colors.white,
                size: 50,
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              title: Text(
                'Attendance Logs',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "Check your logs",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Attendancelogs(
                              username: username,
                            )));
              },
              tileColor: Colors.blue[500],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              // shape: BeveledRectangleBorder(
              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(20.0),
              //         bottomRight: Radius.circular(20.0))),
              leading: Icon(
                Icons.assignment_outlined,
                color: Colors.white,
                size: 50,
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              title: Text(
                'Monthly Report',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "Get your reports",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MonthlyReport()));
              },
              tileColor: Colors.blue[500],
            ),
          ),
          Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: Icon(
                Icons.account_box_outlined,
                color: Colors.white,
                size: 50,
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              title: Text(
                'Interns',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "know your colleagues",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InternDirUser()));
              },
              tileColor: Colors.blue[500],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: Icon(
                Icons.two_wheeler_rounded,
                color: Colors.white,
                size: 50,
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              title: Text(
                'Leaves',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "View applied and remaining leaves",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Leaves()));
              },
              tileColor: Colors.blue[500],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: Icon(
                Icons.notification_important,
                color: Colors.white,
                size: 50,
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              title: Text(
                'Notifications',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "Important events",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Contactss()));
              },
              tileColor: Colors.blue[500],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              // trailing: Icon(Icons.more_vert),
              leading: Icon(
                Icons.calendar_view_day_rounded,
                color: Colors.white,
                size: 50,
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              title: Text(
                'Holiday List',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "Check all the holidays of 2021 ",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HolidayList()));
              },
              tileColor: Colors.blue[500],
            ),
          ),
          // Card(
          //   shape: RoundedRectangleBorder(
          //     side: BorderSide(color: Colors.white70),
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          //   child: ListTile(
          //     leading: Icon(
          //       Icons.help_outline_sharp,
          //       color: Colors.white,
          //       size: 50,
          //     ),
          //     trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
          //     title: Text(
          //       'Help',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontSize: 18,
          //           fontWeight: FontWeight.bold),
          //       textAlign: TextAlign.center,
          //     ),
          //     subtitle: Text(
          //       "Subtitle - 2",
          //       style: TextStyle(color: Colors.white),
          //       textAlign: TextAlign.center,
          //     ),
          //     horizontalTitleGap: 0.1,
          //     minVerticalPadding: 0.1,
          //     minLeadingWidth: 40.0,
          //     onTap: () {
          //       Navigator.push(
          //           context, MaterialPageRoute(builder: (context) => Help()));
          //     },
          //     tileColor: Colors.blue[500],
          //   ),
          // ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              leading: Icon(
                Icons.help_outline_sharp,
                color: Colors.white,
                size: 50,
              ),
              trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
              title: Text(
                'Complaint Register ',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                "Drop your issue",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ComplaintReg()));
              },
              tileColor: Colors.blue[500],
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70),
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: ListTile(
              dense: true,
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              horizontalTitleGap: 0.1,
              minVerticalPadding: 0.1,
              minLeadingWidth: 40.0,
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              },
              tileColor: Colors.red[400],
            ),
          ),
          Card()
        ],
      ),
      // body: Container(
      //   child: SizedBox(
      //     child: Column(
      //       children: [
      //         new Row(
      //           children: [
      //             RaisedButton(
      //                 child: Text('Profile',
      //                     style: TextStyle(color: Colors.white)),
      //                 color: Colors.lightBlue,
      //                 onPressed: () {}),
      //             RaisedButton(
      //                 child: Text('Attendace Sheet',
      //                     style: TextStyle(color: Colors.white)),
      //                 color: Colors.lightBlue,
      //                 onPressed: () {})
      //           ],
      //         ),
      //         Text(
      //           '\n Thanks ' +
      //               username +
      //               ' \n your attendance successfully recorded',
      //           style: TextStyle(color: Colors.black),
      //         ),
      //         //Text('\n \n $now'),
      //         RaisedButton(
      //           child: Text('Logout', style: TextStyle(color: Colors.white)),
      //           color: Colors.red,
      //           onPressed: () {
      //             Navigator.push(
      //               context,
      //               MaterialPageRoute(builder: (context) => MyHomePage()),
      //             );
      //           },
      //         ),
      //         FloatingActionButton(
      //             child: Text('LogOut'),
      //             onPressed: () {
      //               Navigator.push(context,
      //                   MaterialPageRoute(builder: (context) => MyHomePage()));
      //             }),
      //       ],
      //     ),
      //   ),
      // ),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DashboardProfile(
                              username: username,
                            )));
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
            ListTile(
                leading: Icon(Icons.lock),
                title: Text('Alternative Dashboard Design'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProfileDesign(
                                username: username,
                              )));
                }),
            // ListTile(
            //   leading: Icon(Icons.lock),
            //   title: Text('Admin pannel-firebase Registration -testing'),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => RegistrationScreen()));
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
