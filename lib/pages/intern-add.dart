import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AddContacts extends StatefulWidget {
  @override
  _AddContactsState createState() => _AddContactsState();
}

class _AddContactsState extends State<AddContacts> {
  TextEditingController _nameController, _numberController, _emailController;
  // String _typeSelected = '';

  DatabaseReference _ref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _numberController = TextEditingController();
    _emailController = TextEditingController();
    _ref = FirebaseDatabase.instance.reference().child('Contacts');
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
        title: Text('Save Details'),
        backgroundColor: Colors.red[400],
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
                prefixIcon: Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.red[200],
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Enter Email',
                prefixIcon: Icon(
                  Icons.email,
                  size: 30,
                  color: Colors.red[200],
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(height: 15),
            TextFormField(
              controller: _numberController,
              decoration: InputDecoration(
                hintText: 'Enter Number',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  size: 30,
                  color: Colors.red[200],
                ),
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(15),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildContactType('Work'),
                  SizedBox(width: 10),
                  _buildContactType('Family'),
                  SizedBox(width: 10),
                  _buildContactType('Friends'),
                  SizedBox(width: 10),
                  _buildContactType('Others'),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: RaisedButton(
                child: Text(
                  'Save Details',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
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
    String name = _nameController.text;
    String number = _numberController.text;
    String email = _emailController.text;

    Map<String, String> contact = {
      'name': name,
      'number': '+91 ' + number,
      'email': email,

      // 'type': _typeSelected,
    };

    _ref.push().set(contact).then((value) {
      Navigator.pop(context);
    });
  }
}
