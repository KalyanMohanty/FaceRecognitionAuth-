import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: SizedBox(
          child: Column(children: [
            Text(
              '\n Center of Excellence on Artificial Intelligence',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              "\n Email: coeaidirector@cet.edu.in \n \n Contact No.: +91 7327018734",
              style: TextStyle(fontSize: 15),
            ),
            Text(
              "\n \n \n Leave your Comment \n ",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            TextField(
              // obscureText: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(),
                  labelText: 'Name'),
            ),
            TextField(
              // obscureText: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(),
                  labelText: 'Email'),
            ),
            TextField(
              // obscureText: true,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(),
                  labelText: 'Text \n'),
            ),
            RaisedButton(
                child: Text('Comment', style: TextStyle(color: Colors.white)),
                color: Colors.blue[500],
                onPressed: () {})
          ]),
        ),
      ),
    );
  }
}
