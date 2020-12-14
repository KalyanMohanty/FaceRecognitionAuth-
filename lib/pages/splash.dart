import 'dart:async';
import 'home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(SplashScreen());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child('admin');

class SplashScreen extends StatefulWidget {
  static const String idScreen = 'Splash';
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  void handleTimeout() {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (_) => new MyHomePage()));
  }

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 4000));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scaffold(
        backgroundColor: Colors.white,
        body: new Center(
          child: new Image(
            image: new AssetImage("assets/images/coeai.jpg"),
            width: _iconAnimation.value * 500,
            height: _iconAnimation.value * 500,
          ),
        ),
      ),
    );
  }
}
