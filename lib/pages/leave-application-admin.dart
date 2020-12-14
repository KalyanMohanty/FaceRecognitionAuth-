import 'package:flutter/material.dart';
import 'Officein-class.dart';
import 'package:firebase_database/firebase_database.dart';

class LeaveApplicationAdmin extends StatefulWidget {
  @override
  _ShowLogsState createState() => _ShowLogsState();
}

class _ShowLogsState extends State<LeaveApplicationAdmin> {
  List<Admin> adminList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference adminRef =
        FirebaseDatabase.instance.reference().child('Leave application');
    adminRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      adminList.clear();

      for (var individualKey in KEYS) {
        Admin admin = new Admin(
          DATA[individualKey]['name'],
          DATA[individualKey]['complaint'],
          DATA[individualKey]['comment'],
        );
        adminList.add(admin);
      }
      setState(() {
        print('Length: $adminList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Application'),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        color: Colors.red[50],
        padding: EdgeInsets.all(10),
        child: adminList.length == 0
            ? new Text(
                ' Please Wait...',
                style: TextStyle(color: Colors.blue, fontSize: 20),
              )
            : new ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: adminList.length,
                itemBuilder: (_, index) {
                  return LeaveUI(adminList[index].name,
                      adminList[index].complaint, adminList[index].comment);
                },
              ),
      ),
    );
  }

  Widget LeaveUI(String name, String complaint, String comment) {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(5.0),
      child: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(comment,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                // RaisedButton(
                //   onPressed: () => AdminUI(adminList[index].name, complaint, comment),
                //   child: Text('Show'),
                // )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(' ')],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                )
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(complaint)],
            ),
          ],
        ),
      ),
    );
  }

  // Widget AdminUII(String name, String complaint, String comment) {
  //   return Scaffold(
  //     body: Container(
  //       child: Column(
  //         children: <Widget>[
  //           Row(children: <Widget>[
  //             Text(comment),
  //           ]),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
