import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(new MyAppp());
}

class MyAppp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyAppp> {
  InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('About COE-AI'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Expanded(
            child: InAppWebView(
              initialUrl: "https://coeaibbsr.in/",
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

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'dart:async';

// class WebViewClass extends StatefulWidget {
//   @override
//   WebViewClassState createState() => WebViewClassState();
// }

// class WebViewClassState extends State<WebViewClass> {
//   Completer<WebViewController> _controller = Completer<WebViewController>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WebView'),
//       ),
//       body: WebView(
//         initialUrl: 'https://google.com',
//         onWebViewCreated: (WebViewController webViewController) {
//           _controller.complete(webViewController);
//         },
//       ),
//     );
//   }
// }
