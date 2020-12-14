import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnounceM extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AnnounceM> {
  TextEditingController _nameController;
  // String _typeSelected = '';

  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();

    _ref = FirebaseDatabase.instance.reference().child('Announcements');
  }

  Widget _buildContactType(String title) {
    return InkWell(
      child: Container(
        height: 40,
        width: 90,
        // decoration: BoxDecoration(
        //   color: _typeSelected == title
        //       ? Colors.green
        //       : Theme.of(context).accentColor,
        //   borderRadius: BorderRadius.circular(15),
        // ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
      // onTap: () {
      //   setState(() {
      //     _typeSelected = title;
      //   });
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notifications'),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        // color: Colors.red[50],
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Notifications',
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  saveContact();
                },
                color: Colors.red[400],
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24.0)),
              ),
            )
          ],
        ),
      ),
    );
  }

  void saveContact() {
    String message = _nameController.text;

    Map<String, String> contact = {
      'message': message,
      'time': testTest(),

      // 'type': _typeSelected,
    };

    _ref.push().set(contact).then((value) {
      Navigator.pop(context);
    });
  }

  String testTest() {
    var now = new DateTime.now();
    DateFormat timeFormat = DateFormat("HH:MM"); //hour :minute
    String timennow = timeFormat.format(DateTime.now());
    return timennow;
  }
}
