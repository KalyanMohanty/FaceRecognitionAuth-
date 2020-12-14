import 'package:flutter/material.dart';
import 'Officein-class.dart';
import 'package:firebase_database/firebase_database.dart';

class ShowOutLogs extends StatefulWidget {
  @override
  _ShowLogsState createState() => _ShowLogsState();
}

class _ShowLogsState extends State<ShowOutLogs> {
  List<Officeout> officeoutList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference officeoutRef =
        FirebaseDatabase.instance.reference().child('Officeout');
    // .orderByChild('name');

    officeoutRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      officeoutList.clear();

      for (var individualKey in KEYS) {
        Officeout officeout = new Officeout(
          DATA[individualKey]['name'],
          DATA[individualKey]['time'],
          DATA[individualKey]['type'],
        );
        officeoutList.add(officeout);
      }
      setState(() {
        print('Length: $officeoutList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Office Out Logs'),
      ),
      body: Container(
        child: officeoutList.length == 0
            ? new Text(
                ' Please Wait...',
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            : new ListView.builder(
                itemCount: officeoutList.length,
                itemBuilder: (_, index) {
                  return OfficeUI(officeoutList[index].name,
                      officeoutList[index].time, officeoutList[index].type);
                }),
      ),
    );
  }

  Widget OfficeUI(String name, String time, String type) {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(5.0),
      child: new Container(
        padding: new EdgeInsets.all(14.0),
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  type,
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(' ')],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[Text(time)],
            )
          ],
        ),
      ),
    );
  }
}
