// import 'package:FaceNetAuthentication/pages/dark-mode.dart';
import 'package:FaceNetAuthentication/pages/db/database.dart';
import 'package:FaceNetAuthentication/pages/sign-in.dart';
import 'package:FaceNetAuthentication/pages/sign-up.dart';
import 'package:FaceNetAuthentication/services/facenet.service.dart';
import 'package:FaceNetAuthentication/services/ml_vision_service.dart';
import 'package:camera/camera.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyHomePage());
// }
void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var now = new DateTime.now();
  // Services injection
  FaceNetService _faceNetService = FaceNetService();
  MLVisionService _mlVisionService = MLVisionService();
  DataBaseService _dataBaseService = DataBaseService();

  CameraDescription cameraDescription;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _startUp();
  }

  /// 1 Obtain a list of the available cameras on the device.
  /// 2 loads the face net model
  _startUp() async {
    _setLoading(true);

    List<CameraDescription> cameras = await availableCameras();

    /// takes the front camera
    cameraDescription = cameras.firstWhere(
      (CameraDescription camera) =>
          camera.lensDirection == CameraLensDirection.front,
    );

    // start the services
    await _faceNetService.loadModel();
    await _dataBaseService.loadDB();
    _mlVisionService.initialize();

    _setLoading(false);
  }

  // shows or hides the circular progress indicator
  _setLoading(bool value) {
    setState(() {
      loading = value;
    });
  }

  void testTest() {
    var now = new DateTime.now();
    DateFormat timeFormat = DateFormat("HH:MM"); //hour :minute
    String timennow = timeFormat.format(DateTime.now());
    print(now);
    print(timennow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FRS - Attendance'),
        backgroundColor: Colors.blue[800],
        actions: [
          // IconButton(icon: Icon(Icons.search), onPressed: () {}),
          // new PopupMenuButton(
          //   onSelected: launchURL,
          //   itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          //     const PopupMenuItem(
          //       child: const Text(
          //         "Dark Mode",
          //       ),
          //       //   value: "Report",
          //       // ),
          //       // const PopupMenuItem(
          //       //   child: const Text("Help"),
          //       //   value: "Value 1",
          //     ),
          //   ],
          // ),
        ],
        leading: IconButton(
          icon: Image.asset('assets/images/coeai.jpg'),
          onPressed: () {},
        ),
      ),
      body: !loading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Image.asset(
                    'assets/images/logo.jpg',
                    fit: BoxFit.fill,
                  ),
                  new Text('\n \n '),
                  RaisedButton(
                    elevation: 10,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    child: Text(
                      '            Sign In             ',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignIn(
                            cameraDescription: cameraDescription,
                          ),
                        ),
                      );
                    },
                  ),
                  RaisedButton(
                    elevation: 10,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.lightBlue)),
                    child: Text(
                      '            Sign Up            ',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.blue[500],
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignUp(
                            cameraDescription: cameraDescription,
                          ),
                        ),
                      );
                    },
                  ),
                  new Text(
                      " \n \n \n \n Center of Excellence On Artificial Intelligence, \n     College of Engineering and Technology, \n                              Bhubaneswar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                      )),
                  // Text('\n \n $now'),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

_launchURL() async {
  const url = 'https://flutter.io';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

List<String> websiteNames = ['coeai'];
List<String> webUrls = ['https://coeaibbsr.in/'];
launchURL(website) async {
  String url = webUrls[webUrls.indexOf(website)];
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
