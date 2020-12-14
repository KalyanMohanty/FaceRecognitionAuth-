import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

TextEditingController dateCtl = TextEditingController();

class MonthlyReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Report'),
        ),
        body: Center(
          child: Text(
            'In Progress...',
            style: TextStyle(fontSize: 30),
          ),
        ));
  }
}
