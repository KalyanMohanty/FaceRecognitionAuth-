import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:firebase_database/firebase_database.dart';
import 'office-in -logs.dart';
import 'office-out-logs.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Attendancelogs extends StatelessWidget {
  Attendancelogs({Key key, @required this.username}) : super(key: key);
  final String username;
  final dBRef = FirebaseDatabase.instance.reference().child("Officein");
  final dbRef = FirebaseDatabase.instance.reference().child("Officeout");
  final _formKey = GlobalKey<FormState>();
  final listOfIntern = ["Intern", "Summer Intern", "Other"];
  //   final listOfIntern = [
  //   "Attendance Not Recorded",
  //   "Monthly Report",
  //   'Performance',
  //   'Leaves',
  //   "Other"
  // ];
  String dropdownValue = 'Intern';
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
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(bottom: 100, top: 10),
                    margin: EdgeInsets.all(0),
                    child: DropdownButtonFormField(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      decoration: InputDecoration(
                        labelText: '',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none),
                      ),
                      items: listOfIntern.map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String newValue) {
                        setState(
                          () {
                            dropdownValue = newValue;
                          },
                        );
                      },
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please Select your complain';
                        }
                        return null;
                      },
                    ),
                    height: 500.0,
                    width: 400.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/office2.jpg'),
                        fit: BoxFit.fill,
                      ),
                      // shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 500,
                    margin: EdgeInsets.all(4),
                    color: Colors.white,
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 12,
                          width: 1.0,
                        ),
                        RaisedButton(
                          elevation: 10,
                          color: Colors.teal[300],
                          textColor: Colors.white,
                          child: Container(
                            height: 40.0,
                            child: Center(
                              child: Text(
                                'Office In',
                                style: TextStyle(
                                    fontSize: 18.0, fontFamily: 'Brand Bold'),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(24.0)),
                          onPressed: officeIn,
                        ),
                        SizedBox(
                          height: 12,
                          width: 10.0,
                        ),
                        RaisedButton(
                            elevation: 10,
                            color: Colors.teal[300],
                            textColor: Colors.white,
                            child: Container(
                              height: 40.0,
                              child: Center(
                                child: Text(
                                  'Office Out',
                                  style: TextStyle(
                                      fontSize: 18.0, fontFamily: 'Brand Bold'),
                                ),
                              ),
                            ),
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(24.0)),
                            onPressed: (officeOut)),
                        Container(
                            height: 50,
                            width: 30,
                            margin: EdgeInsets.all(15),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RaisedButton(
                                  color: Colors.teal[300],
                                  textColor: Colors.white,
                                  child: Container(
                                    height: 43.0,
                                    child: Center(
                                      child: Text(
                                        'Office In Logs',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Brand Bold'),
                                      ),
                                    ),
                                  ),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(24.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShowInLogs()));
                                  },
                                ),
                                RaisedButton(
                                  color: Colors.teal[300],
                                  textColor: Colors.white,
                                  child: Container(
                                    height: 43.0,
                                    child: Center(
                                      child: Text(
                                        'Office out logs',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontFamily: 'Brand Bold'),
                                      ),
                                    ),
                                  ),
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(24.0)),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShowOutLogs()));
                                  },
                                )
                              ],
                            ))
                        // new Row(
                        //   children: <Widget>[Text('Lab in Logs')],
                        // ),
                        // new Row(
                        //   children: <Widget>[Text('Lab Out Logs')],
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
      'type': dropdownValue,
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
        'type': dropdownValue,
      },
    );
  }

  displayToastMessage(String message, BuildContext context) {
    Fluttertoast.showToast(msg: message);
  }
}

void setState(Null Function() param0) {}
