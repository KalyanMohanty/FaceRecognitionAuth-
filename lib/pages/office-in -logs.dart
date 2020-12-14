import 'package:flutter/material.dart';
import 'Officein-class.dart';
import 'package:firebase_database/firebase_database.dart';

class ShowInLogs extends StatefulWidget {
  @override
  _ShowLogsState createState() => _ShowLogsState();
}

class _ShowLogsState extends State<ShowInLogs> {
  List<Officein> officeinList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DatabaseReference officeinRef =
        FirebaseDatabase.instance.reference().child('Officein');
    //.orderByChild('name');
    ;
    officeinRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;
      officeinList.clear();

      for (var individualKey in KEYS) {
        Officein officein = new Officein(
          DATA[individualKey]['name'],
          DATA[individualKey]['time'],
          DATA[individualKey]['type'],
        );
        officeinList.add(officein);
      }
      setState(() {
        print('Length: $officeinList.length');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Office In Logs'),
      ),
      body: Container(
        child: officeinList.length == 0
            ? new Text(
                ' Please Wait...',
                style: TextStyle(
                  color: Colors.blue,
                ),
              )
            : new ListView.builder(
                itemCount: officeinList.length,
                itemBuilder: (_, index) {
                  return OfficeUI(officeinList[index].name,
                      officeinList[index].time, officeinList[index].type);
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
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
