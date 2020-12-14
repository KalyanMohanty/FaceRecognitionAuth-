/// Flutter code sample for DataTable

// This sample shows how to display a [DataTable] with three columns: name, age, and
// role. The columns are defined by three [DataColumn] objects. The table
// contains three rows of data for three example users, the data for which
// is defined by three [DataRow] objects.
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/data_table.png)

import 'package:flutter/material.dart';

void main() => runApp(HolidayList());

/// This is the main application widget.
class HolidayList extends StatelessWidget {
  static const String _title = 'Holiday List - 2021';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Date',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Day',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Holiday',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('23 Jan')),
            DataCell(Text('Sat')),
            DataCell(Text('Netaji Subhas Chandra Bose Jayanti')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('26 Jan')),
            DataCell(Text('Tue')),
            DataCell(Text('Republic Day')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('16 Feb')),
            DataCell(Text('Tue')),
            DataCell(Text('Vasant Panchami')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('5 Mar')),
            DataCell(Text('Fri')),
            DataCell(Text('Panchayatraj Divas')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11 Mar')),
            DataCell(Text('Thu')),
            DataCell(Text('Maha Shivaratri')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('29 Mar')),
            DataCell(Text('Mon')),
            DataCell(Text('Holi')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('1 Apr')),
            DataCell(Text('Thu')),
            DataCell(Text('Utkal Divas')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('2 Apr')),
            DataCell(Text('Fri')),
            DataCell(Text('Good Friday')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14 Apr')),
            DataCell(Text('Wed')),
            DataCell(Text('Dr Ambedkar Jayanti')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14 Apr')),
            DataCell(Text('Wed')),
            DataCell(Text('Maha Vishuba Sankranti')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('21 Apr')),
            DataCell(Text('Wed')),
            DataCell(Text('Ram Navami')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('13 May')),
            DataCell(Text('Thu')),
            DataCell(Text('Eid al-Fitr')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('12 Jul')),
            DataCell(Text('Mon')),
            DataCell(Text('Ratha Yatra')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Eid al-Adha')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15 Aug')),
            DataCell(Text('Sun')),
            DataCell(Text('INdian Independece Day')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18/19 Aug')),
            DataCell(Text('Thu')),
            DataCell(Text('Ashura')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('11 Sep')),
            DataCell(Text('Sat')),
            DataCell(Text('Nuakhai')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('2 Oct')),
            DataCell(Text('Sat')),
            DataCell(Text('Gnadhi Jayanti')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('14 Oct')),
            DataCell(Text('Thu')),
            DataCell(Text('Maha Navami')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('15 Nov')),
            DataCell(Text('Fri')),
            DataCell(Text('Dussehra')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('18 Oct')),
            DataCell(Text('Mon')),
            DataCell(Text('Prophet\'s Birthday')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('4 Nov')),
            DataCell(Text('Thu')),
            DataCell(Text('Diwali')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('25 Dec')),
            DataCell(Text('Sat')),
            DataCell(Text('Christmas Day')),
          ],
        ),
      ],
    )));
  }
}
