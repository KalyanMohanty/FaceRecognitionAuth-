import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new TeamAi());

var COLORS = [
  Color(0xFFEF7A85),
  Color(0xFFFF90B3),
  Color(0xFFFFC2E2),
  Color(0xFFB892FF),
  Color(0xFFB892FF),
];

class TeamAi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListV(title: ''),
    );
  }
}

class ListV extends StatefulWidget {
  ListV({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<ListV> {
  var data = [
    {
      "title": "Ipsit Misra",
      "content":
          "Email: director@cet.edu.in \nDirector COE-AI\nMob: +91- 7327018734",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://media-exp1.licdn.com/dms/image/C4D03AQFY2GPb83fgmA/profile-displayphoto-shrink_800_800/0/1516429397537?e=1613001600&v=beta&t=wwW34v3VHrNIr9WBFMQtoJGrirMWdBYloE2YF_ZEKD0"
    },
    {
      "title": "Kalyan K Mohanty",
      "content":
          "Email: coeaikkm@cet.edu.in \nMob: +91-8249724583, System No: 14\nProjects: FRS,TDE,EMD",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://gravatar.com/avatar/41973f483d4283572c2f8ae2477c42bd?s=200"
    },
    {
      "title": "Priyanka P Pattnaik",
      "content":
          "Email: coeaippp@cet.edu.in \nMob: +91-9938189089, System No: 12\nProjects: FRS, Nalco",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://scontent.fbbi1-1.fna.fbcdn.net/v/t1.0-9/49172807_2175998385946442_4368786835946602496_o.jpg?_nc_cat=104&ccb=2&_nc_sid=09cbfe&_nc_ohc=PJbPJ9STjAYAX_oguyb&_nc_ht=scontent.fbbi1-1.fna&oh=69a68408dc04d19f3bf9f36b2c784eda&oe=5FF507E7"
    },
    {
      "title": "Manas R Mohanty",
      "content":
          "Email: coeaimrm@cet.edu.in \nMob: +91-7854050892, System No: 03\nProjects: ANPR,Chatbot",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://scontent.fbbi1-2.fna.fbcdn.net/v/t1.0-9/387708_292112660830142_1243842984_n.jpg?_nc_cat=101&ccb=2&_nc_sid=2c4854&_nc_ohc=PGbnDhcNCQYAX-aH14O&_nc_ht=scontent.fbbi1-2.fna&oh=e9af556153b35a3f3e7990594aa1f192&oe=5FF55406"
    },
    {
      "title": "Priti Sahoo",
      "content":
          "Email: coeaips@cet.edu.in \nMob: +91-6370414474, System No: 05\nProjects:Library Management, Chatbot",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://media-exp1.licdn.com/dms/image/C5103AQFlQewHhA4ScQ/profile-displayphoto-shrink_800_800/0/1581503380322?e=1613001600&v=beta&t=noUdJiGU1jgJh1xnwNgvwoLoz_ZTw5EgdYe75kQ5TCM"
    },
    {
      "title": "Khirod Behera",
      "content":
          "Email: coeaikb@cet.edu.in \nMob: +91-8908168688, System No: 04\nProjects: Resume Parser, Nalco",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://scontent.fbbi1-2.fna.fbcdn.net/v/t1.0-9/97196062_3026203774159934_4297517424242065408_o.jpg?_nc_cat=108&ccb=2&_nc_sid=09cbfe&_nc_ohc=kaXQerOtOzcAX_geL8o&_nc_ht=scontent.fbbi1-2.fna&oh=3433e4537d9b6d27683418994069a2e2&oe=5FF5BDBA"
    },
    {
      "title": "Sushree Barsa Pattnayak",
      "content":
          "Email: coeais@cet.edu.in \nMob: +91-7008817054, System No: 11\nProjects: ANPR, Complaint Register",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://media-exp1.licdn.com/dms/image/C5603AQHqyE21NmGzIg/profile-displayphoto-shrink_800_800/0/1588224628939?e=1613001600&v=beta&t=gh5XbWHxllr7_LsW4tJ8iHHlmwTTz-KzgfW5GWeQGhk"
    },
    {
      "title": "Chinmaya Sahu",
      "content":
          "Email: coeaicks@cet.edu.in \nMob: +91-8260716896, System No: 06\nProjects: ANPR, Social Distancing",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://media-exp1.licdn.com/dms/image/C5103AQHOwxsmOjYQCg/profile-displayphoto-shrink_800_800/0/1545054126679?e=1613001600&v=beta&t=osfFbxl8dhZiClRCQDSeRY7KcmHgKIVIBuMnGISmzsY"
    },
    {
      "title": "Jaya Darshana Singham",
      "content":
          "Email: coeaijds@cet.edu.in \nMob: +91-7063678579, System No: 09\nProjects:Library Management, Chatbot",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://media-exp1.licdn.com/dms/image/C5603AQGwZAZ1j9Bhjg/profile-displayphoto-shrink_800_800/0/1587717018234?e=1613001600&v=beta&t=AiC_fWNmVJbdi0C8GwmliVxPlg56e0LK9AG5ylgkOAA"
    },
    {
      "title": "Susantini Behera",
      "content":
          "Email: coeaisb@cet.edu.in \nMob: +91-9304891055, System No: 01\nProjects: ANPR, HR-Managemnt",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://scontent.fbbi1-1.fna.fbcdn.net/v/t1.0-9/123389598_3187713104671865_1825653776566751438_o.jpg?_nc_cat=107&ccb=2&_nc_sid=09cbfe&_nc_ohc=roxftyJD4x0AX9W6wKz&_nc_ht=scontent.fbbi1-1.fna&oh=8cbe23c32531ae75a37441a6b00b2817&oe=5FF5E693"
    },
    {
      "title": "Smruti Shikta das",
      "content":
          "Email: coeaissd@cet.edu.in \nMob: +91-8118052696, System No: 08\nProjects: Energy Predictor",
      "color": COLORS[new Random().nextInt(5)],
      "image": "https://www.coeaibbsr.in/static/img/intern/smruti.jpg"
    },
    {
      "title": "Devdarshan Mishra",
      "content":
          "Email: dev.ddm7@gmail.com \nMob: +91-9668205801, System No: 15\nProjects:AWS, fire Detection",
      "color": COLORS[new Random().nextInt(5)],
      "image":
          "https://scontent.fbbi1-2.fna.fbcdn.net/v/t1.0-9/94224523_1449711365211022_8227653683970572288_o.jpg?_nc_cat=110&ccb=2&_nc_sid=09cbfe&_nc_ohc=pHvGX851bB4AX_d_v8M&_nc_ht=scontent.fbbi1-2.fna&oh=afc9065f07ebf071cdeda760399c2ddf&oe=5FF4F6C6"
    },
    {
      "title": "",
      "content": "",
      "color": COLORS[new Random().nextInt(5)],
      "image": ""
    },
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: new Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: new Stack(
        children: <Widget>[
          new Transform.translate(
            offset:
                new Offset(0.0, MediaQuery.of(context).size.height * 0.1050),
            child: new ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              scrollDirection: Axis.vertical,
              primary: true,
              itemCount: data.length,
              itemBuilder: (BuildContext content, int index) {
                return AwesomeListItem(
                    title: data[index]["title"],
                    content: data[index]["content"],
                    color: data[index]["color"],
                    image: data[index]["image"]);
              },
            ),
          ),
          new Transform.translate(
            offset: Offset(0.0, -56.0),
            child: new Container(
              child: new ClipPath(
                clipper: new MyClipper(),
                child: new Stack(
                  children: [
                    new Image.network(
                      //"https://picsum.photos/800/400?random",
                      "https://builtin.com/sites/default/files/styles/medium/public/2018-08/artificial-intelligence-companies.jpg",
                      fit: BoxFit.cover,
                    ),
                    new Opacity(
                      opacity: 0.2,
                      child: new Container(color: COLORS[0]),
                    ),
                    new Transform.translate(
                      offset: Offset(0.0, 50.0),
                      child: new ListTile(
                        leading: new CircleAvatar(
                          child: new Container(
                            decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                              image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://scontent.fbbi1-2.fna.fbcdn.net/v/t1.0-9/81896509_108991477301195_1201211234960015360_n.jpg?_nc_cat=101&ccb=2&_nc_sid=09cbfe&_nc_ohc=nDA8xtv75uoAX9kjAz0&_nc_ht=scontent.fbbi1-2.fna&oh=d951cdfc9a8a2afa50fd5e530cce0818&oe=5FF64240"),
                              ),
                            ),
                          ),
                        ),
                        title: new Text(
                          "Team - AI",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              letterSpacing: 2.0),
                        ),
                        subtitle: new Text(
                          "Center of Excellence on Artificial Intelligence",
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              letterSpacing: 2.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path p = new Path();
    p.lineTo(size.width, 0.0);
    p.lineTo(size.width, size.height / 4.75);
    p.lineTo(0.0, size.height / 3.75);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class AwesomeListItem extends StatefulWidget {
  String title;
  String content;
  Color color;
  String image;

  AwesomeListItem({this.title, this.content, this.color, this.image});

  @override
  _AwesomeListItemState createState() => new _AwesomeListItemState();
}

class _AwesomeListItemState extends State<AwesomeListItem> {
  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(width: 10.0, height: 190.0, color: widget.color),
        new Expanded(
          child: new Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: new Text(
                    widget.content,
                    style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
        new Container(
          height: 150.0,
          width: 150.0,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              new Transform.translate(
                offset: new Offset(50.0, 0.0),
                child: new Container(
                  height: 100.0,
                  width: 100.0,
                  color: widget.color,
                ),
              ),
              new Transform.translate(
                offset: Offset(10.0, 20.0),
                child: new Card(
                  elevation: 20.0,
                  child: new Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 10.0,
                            color: Colors.white,
                            style: BorderStyle.solid),
                        image: DecorationImage(
                          image: NetworkImage(widget.image),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
