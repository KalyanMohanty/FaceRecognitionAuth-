import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'intern-add.dart';

class InternDirUser extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<InternDirUser> {
  Query _ref;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ref = FirebaseDatabase.instance
        .reference()
        .child('Contacts')
        .orderByChild('name');
  }

  Widget _buildContactItem({Map contact}) {
    // Color typeColor = getTypeColor(contact['type']);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1),
      padding: EdgeInsets.all(10),
      height: 90,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['name'],
                style: TextStyle(
                    fontSize: 16,
                    // color: Theme.of(context).primaryColor,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.phone_iphone,
                color: Theme.of(context).accentColor,
                size: 20,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                contact['number'],
                style: TextStyle(
                    fontSize: 16,
                    //color: Theme.of(context).accentColor,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Icon(
                    Icons.email,
                    color: Theme.of(context).primaryColor,
                    size: 20,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    contact['email'],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),

              // SizedBox(width: 15),
              // Icon(
              //   Icons.email,
              //   // color: typeColor,
              //   size: 20,
              // ),
              // SizedBox(
              //   width: 6,
              // ),
              // Text(
              //   contact['email'],
              //   style: TextStyle(
              //       fontSize: 16,
              //       // color: typeColor,
              //       fontWeight: FontWeight.w600),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Intern Directory'),
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
      //         return AddContacts();
      //       }),
      //     );
      //   },
      //   child: Icon(Icons.add, color: Colors.white),
      // ),
    );
  }

  // Color getTypeColor(String type) {
  //   Color color = Theme.of(context).accentColor;

  //   if (type == 'Work') {
  //     color = Colors.brown;
  //   }

  //   if (type == 'Family') {
  //     color = Colors.green;
  //   }

  //   if (type == 'Friends') {
  //     color = Colors.teal;
  //   }
  //   return color;
  // }
}
