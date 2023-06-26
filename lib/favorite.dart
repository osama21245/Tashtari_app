import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:woocommerce_app/view/widget/favorite/Customefavoritecard.dart';
import 'package:woocommerce_app/view/widget/home/CustomSearchResult.dart';
import 'package:woocommerce_app/view/widget/home/customSearch.dart';

import 'HandlingDataView.dart';
import 'controller/favouriteController.dart';
import 'core/function/databaseTranslate.dart';
import 'linksApi.dart';

class Favorite extends GetView<ImpfavourateController> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ImpfavourateController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: GetBuilder<ImpfavourateController>(
            builder: (controller) => Container(
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, right: 12.0, top: 8),
                        child: Customsearech(
                          apperFavandNot: false,
                          onchange: (val) {
                            controller.checkSearch(val);
                          },
                          onpressedfav: () {},
                          mycontroller: controller.search2!,
                          onpressedsearch: () async {
                            controller.onsearchitems();
                            await controller.search();
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      HandlingDataView(
                          statusRequest: controller.statusRequest,
                          widget: !controller.issearch
                              ? GridView.builder(
                                  itemCount: controller.data.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 3.3,
                                          crossAxisCount: 1),
                                  itemBuilder: (BuildContext context, i) {
                                    return CustomfavoriteCard(
                                      image: Apilinks.linkimageItems +
                                          "/" +
                                          controller.data[i].itemsImage!,
                                      title: databaseTranslate(
                                          "${controller.data[i].itemsNameAr}",
                                          "${controller.data[i].itemsName}"),
                                      subtitle:
                                          "\$ ${controller.data[i].itemsPrice}",
                                      ondelete: () async {
                                        await controller.deleteitemfromFav(
                                            controller.data[i].favoriteId
                                                .toString());
                                        controller.refreshpage();
                                      },
                                      size: size,
                                    );
                                  })
                              : searchResult(
                                  itemmodel: controller.searchlist,
                                ))
                    ],
                  ),
                )));
  }
}


// class items extends GetView<ImpfavourateController> {
//   Favoritemodel favoritemodel;
//   items({super.key, required this.favoritemodel});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 20.0, left: 7),
//           child: ListTile(
//             trailing: IconButton(
//                 onPressed: () {
                 
//                   controller.deletefromfav(favoritemodel.itemsId.toString());
//                 },
//                 icon: Icon(
//                   Icons.delete_outline,
//                   color: Colors.red,
//                 )),
//             subtitle: Text(
//               "\$ ${favoritemodel.itemsPrice}",
//               style: TextStyle(fontWeight: FontWeight.w300),
//             ),
//             title: Text(
//               databaseTranslate(
//                   "${favoritemodel.itemsNameAr}", "${favoritemodel.itemsName}"),
//             ),
//             leading: CachedNetworkImage(
//               height: size.height * 0.15,
//               fit: BoxFit.fill,
//               imageUrl:
//                   Apilinks.linkimageItems + "/" + favoritemodel.itemsImage!,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// Card(
//       child: Padding(
//         padding: const EdgeInsets.all(13),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(bottom: 20),
//               child: CachedNetworkImage(
//                 height: size.height * 0.15,
//                 fit: BoxFit.fill,
//                 imageUrl:
//                     Apilinks.linkimageItems + "/" + favoritemodel.itemsImage!,
//               ),
//             ),
//             Text(
//               databaseTranslate(
//                   "${favoritemodel.itemsNameAr}", "${favoritemodel.itemsName}"),
//               style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontFamily: "PlayfairDisplay",
//                   fontSize: 16,
//                   color: Colors.black),
//             ),
//           ],
//         ),
//       ),
//     );