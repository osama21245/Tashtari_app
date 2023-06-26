// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../../../controller/home/homeControoler.dart';
// import '../../../core/constant/color.dart';
// import '../../../core/function/databaseTranslate.dart';
// import '../../../data/model/item_model.dart';
// import '../../../linksApi.dart';

// class searchResult extends GetView<ImphomePageControoler> {
//   final List<Itemmodel> itemmodel;
//   searchResult({required this.itemmodel, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemCount: itemmodel.length,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) => Padding(
//               padding: const EdgeInsets.only(top: 8.0),
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: Card(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(15.0),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                   child: CachedNetworkImage(
//                                 imageUrl: Apilinks.linkimageItems +
//                                     "/" +
//                                     itemmodel[index].itemsImage!,
//                                 fit: BoxFit.fill,
//                               )),
//                               Expanded(
//                                   flex: 2,
//                                   child: ListTile(
//                                     title: Text(databaseTranslate(
//                                         "${itemmodel[index].itemsNameAr}",
//                                         "${itemmodel[index].itemsName}")),
//                                     subtitle: Text(databaseTranslate(
//                                         "${itemmodel[index].categoriesNameAr}",
//                                         "${itemmodel[index].categoriesName}")),
//                                   )),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 5, horizontal: 15),
//                           decoration: const BoxDecoration(
//                             border: Border(
//                               top: BorderSide(
//                                 color: Color.fromARGB(255, 224, 224, 224),
//                               ),
//                             ),
//                           ),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 '\$${itemmodel[index].itemsPrice}',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               MaterialButton(
//                                   textColor: Colors.white,
//                                   color: AppColor.primaryColor,
//                                   onPressed: () {
//                                     controller
//                                         .gotoitemdetails(itemmodel[index]);
//                                   },
//                                   child: const Text('Buy Now'))
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ));
//   }
// }
