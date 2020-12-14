import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_test/home.dart';
import 'package:flutter/material.dart';

class Leaves extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Leaves',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeaveAppllication(title: 'Leaves'),
    );
  }
}

class LeaveAppllication extends StatefulWidget {
  LeaveAppllication({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<LeaveAppllication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image(
                image: NetworkImage(
                    'https://i.pinimg.com/474x/23/cc/74/23cc74641853dbc37b34ada593a3fc6d.jpg'),
              ),
              Text("Apply Here ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      // fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal)),
              RegisterCom(),
              Card(
                margin: EdgeInsets.all(10),
                elevation: 5.0,
                shadowColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue[400], width: 2.0),
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.white,
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
                          'Note:',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                          ),
                        ),
                        subtitle: Text(
                          '1. Medical Leaves: 10\n\n2. Casual Leaves: 10\n\n3. Work from home: 10',
                          style: TextStyle(
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterCom extends StatefulWidget {
  RegisterCom({Key key}) : super(key: key);

  @override
  _RegisterComState createState() => _RegisterComState();
}

class _RegisterComState extends State<RegisterCom> {
  final _formKey = GlobalKey<FormState>();
  final listOfComp = ["Medical Leave", 'Casual Leave', "Work from home"];
  String dropdownValue = 'Medical Leave';
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final dbRef =
      FirebaseDatabase.instance.reference().child("Leave application");

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Enter Your Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Your Name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: DropdownButtonFormField(
                value: dropdownValue,
                icon: Icon(Icons.arrow_downward),
                decoration: InputDecoration(
                  labelText: "Select Type",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: listOfComp.map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (String newValue) {
                  setState(() {
                    dropdownValue = newValue;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Select your complain';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: TextFormField(
                // keyboardType: TextInputType.number,
                controller: ageController,
                decoration: InputDecoration(
                  labelText: "Reason",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter your message';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.lightBlue,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        dbRef.push().set({
                          "name": nameController.text,
                          "complaint": ageController.text,
                          "comment": dropdownValue
                        }).then((_) {
                          Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Thank You!' + ' ' + nameController.text)));
                          ageController.clear();
                          nameController.clear();
                        }).catchError((onError) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text(onError)));
                        });
                      }
                    },
                    elevation: 10,
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Brand Bold',
                          color: Colors.white),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0)),
                  ),
                ],
              ),
            )
          ],
        )));
  }

  @override
  void dispose() {
    super.dispose();
    ageController.dispose();
    nameController.dispose();
  }
}
