// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:woocommerce_app/HandlingDataView.dart';

// import 'controller/Testcontroller.dart';
// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

// class Testcode extends StatefulWidget {
//   const Testcode({super.key});

//   @override
//   State<Testcode> createState() => _TestcodeState();
// }

// class _TestcodeState extends State<Testcode> {
//   @override
//   @override
//   Widget build(BuildContext context) {
//     final dio = Dio();
//     getData() async {
 
      
//       var response = await http
//           .post(Uri.parse("http://osamagamil.rf.gd/ecommerce2/home.php"),
//               body: {});

//       String responseapi = response.data;
//       var _data = jsonDecode(responseapi);
      
//       print(_data);
//       if (response.statusCode == 200 ||
//           response.statusCode == 201 ||
//           response.statusCode == 202) {
//         print(_data);
//         print("suc");
//       } else {
//         print("cant reach to response");
//       }
      
//       // if (responsebody != null) {
//       //   print(responsebody);
//       // } else {
//       //   print("cant reach to response");
//       // }
//     }

//     void initState() {
//       getData();
//       super.initState();
//     }

//     return Scaffold(
//         body: Center(
//       child: Container(
//         child: MaterialButton(
//             child: Text("ya Rab"),
//             onPressed: () {
//               getData();

              
//             }),
//       ),
//     ));
//   }
// }

// class HttpPost {
// }












// Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: AppColor.backgroundcolor,
//         elevation: 0.0,
//         title: Text('ResetPassword',
//             style: Theme.of(context)
//                 .textTheme
//                 .headline1!
//                 .copyWith(color: AppColor.grey)),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//         child: Form(
//           key: controller.formstate,
//           child: ListView(children: [
//             const SizedBox(height: 20),
//             CustomTextTitleAuth(text: "Please Enter New Password"),
//             const SizedBox(height: 10),
//             CustomTextBodyAuth(text: "35".tr),
//             const SizedBox(height: 15),
//             CustonTextFormAuth(
//               ontap: () {
//                 controller.changepass();
//               },
//               hidepassword: controller.showpassword,
//               valid: (val) {
//                 return validinput(val!, 3, 40, "password");
//               },
//               mycontroller: controller.password,
//               hinttext: "11".tr,
//               iconData: Icons.lock_outline,
//               labeltext: "12".tr,
//               // mycontroller: ,
//             ),
//             CustonTextFormAuth(
//               ontap: () {
//                 controller.changepass();
//               },
//               hidepassword: controller.showpassword,

//               valid: (val) {
//                 return validinput(val!, 3, 40, "password");
//               },
//               mycontroller: controller.password,
//               hinttext: "Re" + " " + "Enter Your password",
//               iconData: Icons.lock_outline,
//               labeltext: "12".tr,
//               // mycontroller: ,
//             ),
//             CustomButtomAuth(
//                 text: "Save",
//                 onPressed: () {
//                   // controller.goToSuccessResetPassword();
//                 }),
//             const SizedBox(height: 40),
//           ]),
//         ),
//       ),
//     );
// Scaffold(
//       body: Form(
//         key: controller.formstate,
//         child: Container(
//           padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//           child: ListView(children: [
//             SizedBox(height: size.height * 0.04),
//             Text("Reset password",
//                 textAlign: TextAlign.center,
//                 style: Theme.of(context)
//                     .textTheme
//                     .headline1!
//                     .copyWith(color: Color.fromARGB(255, 138, 137, 138))),
//             SizedBox(height: size.height * 0.02),
//             CustomTextBodyAuth(text: "Please Enter New Password"),
//             SizedBox(height: size.height * 0.06),
//             GetBuilder<ImploginController>(
//               builder: (controller) => CustonTextFormAuth(
//                 ontap: () {
//                   controller.changepass();
//                 },
//                 hidepassword: controller.showpassword,
//                 valid: (val) {
//                   return validinput(val!, 6, 100, "password");
//                 },
//                 mycontroller: controller.password,
//                 hinttext: "11".tr,
//                 iconData: Icons.lock_outline,
//                 labeltext: "12".tr,
//                 // mycontroller: ,
//               ),
//             ),
//             GetBuilder<ImpresetpasswordController>(
//               builder: (controller) => CustonTextFormAuth(
//                 ontap: () {
//                   controller.changepass();
//                 },
//                 hidepassword: controller.showpassword,
//                 valid: (val) {
//                   return validinput(val!, 6, 100, "password");
//                 },
//                 mycontroller: controller.password,
//                 hinttext: "Re Enter Your Password",
//                 iconData: Icons.lock_outline,
//                 labeltext: "12".tr,
//                 // mycontroller: ,
//               ),
//             ),
//             CustomButtomAuth(
//                 text: "Save",
//                 onPressed: () {
//                   controller.ResetPassword();
//                 }),
//             SizedBox(height: size.height * 0.05),
//           ]),
//         ),
//       ),
//     );