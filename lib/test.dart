import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(50.0),
            // child: Container(
            //     width: double.infinity,
            //     height: 300,
            //     child: ModelViewer(src: "assets/images/galaxy_a12.glb")
            //     // WebView(
            //     //   initialUrl: "https://app.vectary.com/p/2fUGZ4FQQR3fIw5NJF8Ov1/",
            //     //   javascriptMode: JavascriptMode.unrestricted,
            //     // ),
            //     ),
          )
        ],
      ),
    );
  }
}
