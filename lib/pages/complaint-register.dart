import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_test/home.dart';
import 'package:flutter/material.dart';

class ComplaintReg extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Complaint Register',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePagee(title: 'Complaint Register'),
    );
  }
}

class MyHomePagee extends StatefulWidget {
  MyHomePagee({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Please Register Your Complaint ",
                  style: TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 20,
                      // fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal)),
              RegisterCom(),
            ]),
      )),
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
  final listOfComp = [
    "Attendance Not Recorded",
    "Monthly Report",
    'Performance',
    'Leaves',
    "Other"
  ];
  String dropdownValue = 'Attendance Not Recorded';
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final dbRef =
      FirebaseDatabase.instance.reference().child("FRS complaint register");

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
                  labelText: "Enter your message",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Enter oyour message';
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
