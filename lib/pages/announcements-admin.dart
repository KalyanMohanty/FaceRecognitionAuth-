import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'add-announcemnets-admin.dart';
import 'package:intl/intl.dart';
// import 'package:admin/announcements-admin.dart';

class Contactss extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contactss> {
  Query _ref;
  String testTest() {
    var now = new DateTime.now();
    DateFormat timeFormat = DateFormat("HH:MM"); //hour :minute
    String timennow = timeFormat.format(DateTime.now());
    return timennow;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance.reference().child('Announcements');
    //.orderByChild('name');
  }

  Widget _buildContactItem({Map contact}) {
    // Color typeColor = getTypeColor(contact['type']);
    return Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(15),
        height: 100,
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            Text(
              contact['message'],
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                // color: Theme.of(context).primaryColor),
                color: Colors.black,
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: Container(
        height: double.infinity,
        child: FirebaseAnimatedList(
          query: _ref,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = snapshot.value;
            return _buildContactItem(contact: contact);
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (_) {
      //         return AnnounceM();
      //       }),
      //     );
      //   },
      //   child: Icon(Icons.add, color: Colors.white),
      // ),
    );
  }

  Color getTypeColor(String type) {
    Color color = Theme.of(context).accentColor;

    // if (type == 'Work') {
    //   color = Colors.brown;
    // }

    // if (type == 'Family') {
    //   color = Colors.green;
    // }

    // if (type == 'Friends') {
    //   color = Colors.teal;
    // }
    // return color;
  }
}
