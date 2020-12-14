import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new EMail());
}

class EMail extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<EMail> {
  InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mail'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: InAppWebView(
              initialUrl: "https://mail.google.com/mail/u/0/#inbox",
              initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(
                debuggingEnabled: true,
              )),
              onWebViewCreated: (InAppWebViewController controller) {
                webViewController = controller;
              },
              onLoadStart: (InAppWebViewController controller, String url) {},
              onLoadStop: (InAppWebViewController controller, String url) {},
            ),
          ),
        ])),
      ),
    );
  }
}
