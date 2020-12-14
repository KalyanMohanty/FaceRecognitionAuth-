import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'office-in -logs.dart';
import 'office-out-logs.dart';
import 'attendance-logs.dart';
// class HolidayList extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

class Attendancelog extends StatelessWidget {
  Attendancelog({Key key, @required this.username}) : super(key: key);
  final String username;
  final dBRef = FirebaseDatabase.instance.reference().child("Officein");
  final dbRef = FirebaseDatabase.instance.reference().child("Officeout");
  var retrievedName = "";
  String name = "";
  @override
  void initState() {
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child('Office time');
    //.child('Office In');
    referenceData.once().then((DataSnapshot dataSnapShot) {
      print(dataSnapShot.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Attendance Logs'),
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey)),
              child: Text(
                'LAB In',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: officeIn,
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey)),
              child: Text(
                'LAB Out',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: officeOut,
              onLongPress: () => new DateTime.now(),
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey)),
              child: Text(
                'Lab In Logs',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowInLogs()));
              },
            ),
            RaisedButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.grey)),
              color: Colors.blue,
              child: Text(
                'Lab Out Logs',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowOutLogs()));
              },
            ),
            RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.grey)),
                color: Colors.blue,
                child: Text(
                  'Test Design',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {}
                //   Navigator.push(
                //       context, MaterialPageRoute(builder: (context) => Design()));
                // },
                ),
          ],
        )));
  }

  void officeIn() {
    var now = new DateTime.now();
    DateFormat timeFormat = DateFormat("HH:MM"); //hour :minute
    String timennow = timeFormat.format(DateTime.now());
    // var fiftyDaysFromNow = now.add(new Duration(days: 50));
    dBRef.push()
        //.child('office in')
        .set({
      'name': '$username',
      'time': '$now',
      'type': 'Intern',
    });
  }

  void officeOut() {
    var now = new DateTime.now();
    DateFormat timeFormat = DateFormat("HH:MM"); //hour :minute
    String timennow = timeFormat.format(DateTime.now());
    dbRef.push().set(
      {
        'name': '$username',
        'time': '$now',
        'type': 'Intern',
      },
    );
  }

  // readData() {
  //   dBRef.once().then((DataSnapshot snapshot) {
  //     var readData = 'Data : ${snapshot.value}';
  //     retrievedName = readData;
  //     print(retrievedName);
  //   });
  // }
}
