// import 'dart:async';

// import 'package:flutter/material.dart';


// import 'package:flutter_spinkit/flutter_spinkit.dart';

// // void main() {
// //   runApp(MaterialApp(
// //     home: SplashScreen(),
// //   ));
// // }

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   final spinkit = SpinKitFadingCircle(
//     itemBuilder: (BuildContext context, int index) {
//       return DecoratedBox(
//         decoration: BoxDecoration(
//           color: index.isEven ? Colors.red : Colors.green,
//         ),
//       );
//     },
//   );

//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     Timer(Duration(seconds: 3), () => goToHomeScreen());
//   }

//   goToHomeScreen() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (BuildContext context) => homeScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//               child: Container(
//                   height: 100, child: Image.asset("assets/images/logo.png"))),
//           SizedBox(
//             height: 30,
//           ),
//           Text("My Store Name"),
//           SizedBox(
//             height: 30,
//           ),
//           spinkit
//         ],
//       ),
//     );
//   }
// }
