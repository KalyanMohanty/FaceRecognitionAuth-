import 'package:FaceNetAuthentication/pages/announcements-admin.dart';
import 'package:flutter/material.dart';
import 'show-complaints.dart';
import 'add-announcemnets-admin.dart';
import 'intern-directory-admin.dart';
import 'leave-application-admin.dart';

class AdminPannel extends StatelessWidget {
  static const String idScreen = 'admin';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Admin Pannel',
          ),
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
                          // leading: Icon(
                          //   Icons.access_time_sharp,
                          //   color: Colors.white,
                          //   size: 50,
                          // ),
                          title: const Text(
                            'Received Complaints',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Attendance | Report | Performance | Others',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShowComplaint()),
                            );
                          },
                        ),
                        // ButtonBar(
                        //   alignment: MainAxisAlignment.end,
                        //   children: [
                        //     FlatButton(
                        //       textColor: const Color(0xFF6200EE),
                        //       onPressed: () {
                        //         // Perform some action
                        //       },
                        //       child: const Text(
                        //         'Show',
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.access_time_sharp,
                          //   color: Colors.white,
                          //   size: 50,
                          // ),
                          title: const Text(
                            'Add notifications',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Notifications for users',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnnounceM()),
                            );
                          },
                        ),
                        // ButtonBar(
                        //   alignment: MainAxisAlignment.end,
                        //   children: [
                        //     FlatButton(
                        //       textColor: const Color(0xFF6200EE),
                        //       onPressed: () {
                        //         // Perform some action
                        //       },
                        //       child: const Text(
                        //         'Add',
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.access_time_sharp,
                          //   color: Colors.white,
                          //   size: 50,
                          // ),
                          title: const Text(
                            'Add Inten Details',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Name | Email | Mob No.',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InternDirAdmin()),
                            );
                          },
                        ),
                        // ButtonBar(
                        //   alignment: MainAxisAlignment.end,
                        //   children: [
                        //     FlatButton(
                        //       textColor: const Color(0xFF6200EE),
                        //       onPressed: () {
                        //         // Perform some action
                        //       },
                        //       child: const Text(
                        //         'Add',
                        //         style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        ListTile(
                          // leading: Icon(
                          //   Icons.access_time_sharp,
                          //   color: Colors.white,
                          //   size: 50,
                          // ),
                          title: const Text(
                            'Leave Application',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          subtitle: Text(
                            'Medical | Casual | Work from Home',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LeaveApplicationAdmin()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.all(15),
                  //   height: 200,
                  //   child: ListView(
                  //     scrollDirection: Axis.horizontal,
                  //     children: <Widget>[
                  //       Container(
                  //         margin: EdgeInsets.all(12),
                  //         width: 200,
                  //         color: Colors.red,
                  //         child: RaisedButton(
                  //           color: Colors.red[300],
                  //           child: Text(
                  //             'Received Complaints',
                  //             textAlign: TextAlign.center,
                  //             style:
                  //                 TextStyle(fontSize: 20, color: Colors.white),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => ShowComplaint()));
                  //           },
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.all(12),
                  //         width: 200,
                  //         color: Colors.blueGrey,
                  //         child: RaisedButton(
                  //           color: Colors.blue[300],
                  //           child: Text(
                  //             'Add notifications',
                  //             textAlign: TextAlign.center,
                  //             style:
                  //                 TextStyle(fontSize: 20, color: Colors.white),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => AnnounceM()));
                  //           },
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.all(12),
                  //         width: 200,
                  //         color: Colors.green,
                  //         child: RaisedButton(
                  //           color: Colors.orange[300],
                  //           child: Text(
                  //             'Add Inten Details',
                  //             textAlign: TextAlign.center,
                  //             style:
                  //                 TextStyle(fontSize: 20, color: Colors.white),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.push(
                  //                 context,
                  //                 MaterialPageRoute(
                  //                     builder: (context) => InternDirAdmin()));
                  //           },
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        // Container(
                        //   width: 50,
                        //   height: 100,
                        //   color: Colors.yellowAccent,
                        // ),
                        // Container(
                        //   width: 50,
                        //   height: 100,
                        //   color: Colors.blue,
                        // ),
                        // Container(
                        //   width: 50,
                        //   height: 100,
                        //   color: Colors.green,
                        // ),
                        // Container(
                        //   width: 50,
                        //   height: 100,
                        //   color: Colors.red,
                        // ),
                        // Container(
                        //   width: 50,
                        //   height: 100,
                        //   color: Colors.yellowAccent,
                        // ),
                        // Container(
                        //   width: 50,
                        //   height: 100,
                        //   color: Colors.red,
                        // )
                      ],
                    ),
                  ),
                  // Container(
                  //   height: 200,
                  //   child: GridView.count(
                  //     scrollDirection: Axis.horizontal,
                  //     crossAxisCount: 2,
                  //     children: List.generate(10, (index) {
                  //       return Container(
                  //         child: Card(
                  //           color: Colors.amber,
                  //         ),
                  //       );
                  //     }),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
// ListView(
//   children: <Widget>[
//     Card(
//       elevation: 150,
//       margin: EdgeInsets.symmetric(
//         vertical: 50,
//         horizontal: 10,
//       ),
//       child: ListTile(
//         trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white),
//         title: Text(
//           'Received Complaints',
//           style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold),
//           textAlign: TextAlign.center,
//         ),
//         subtitle: Text(
//           "Click here",
//           style: TextStyle(color: Colors.white),
//           textAlign: TextAlign.center,
//         ),
//         horizontalTitleGap: 0.1,
//         minVerticalPadding: 0.1,
//         minLeadingWidth: 60.0,
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ShowComplaint(),
//             ),
//           );
//         },
//         tileColor: Colors.blue[500],
//       ),
//     ),
//   ],
// ),

// // body: Card(
//   elevation: 10.0,
//   margin: EdgeInsets.all(15.0),
//   child: new Container(
//     padding: new EdgeInsets.all(14.0),
//     child: new Column(children: <Widget>[
//       new Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[Text('n')],
//       ),
//       new Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[Text('njk')],
//       ),
//       new ListView()
//     ]),
//   ),
// ),
//     );
//   }
// }
