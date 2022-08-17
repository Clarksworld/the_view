import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'dart:async';                                    // Add this import
import 'package:webview_in_flutter/src/web_view_stack.dart';                            // Add this import.
import 'src/navigation_controls.dart';
import 'src/web_view_stack.dart';
import 'src/menu.dart';                                // Add this import




void main() {
  runApp(
    const MaterialApp(
      home: WebViewApp(),
    ),
  );
}

class WebViewApp extends StatefulWidget {
  const WebViewApp({super.key});

  @override
  State<WebViewApp> createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {

  final controller = Completer<WebViewController>();    // Instantiate the controller


  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fidle'),
        actions: [
          NavigationControls(controller: controller),
          Menu(controller: controller),                // Add this line

        ],
      ),
      body: WebViewStack(controller: controller),       // Add the controller argument
    );
  }
}