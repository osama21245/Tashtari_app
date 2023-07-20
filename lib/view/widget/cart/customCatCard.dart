import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class CustomCartCard extends StatelessWidget {
  String name;
  String price;
  String count;
  String image;
  final void Function() add;
  final void Function() remove;
  CustomCartCard(
      {super.key,
      required this.count,
      required this.name,
      required this.price,
      required this.image,
      required this.add,
      required this.remove});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 19,
        right: 19,
        top: 3,
      ),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: CachedNetworkImage(
                      imageUrl: image,
                    )),
                Expanded(
                    flex: 4,
                    child: ListTile(
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Text(
                          price,
                          style: const TextStyle(color: AppColor.primaryColor),
                        ),
                      ),
                      title: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 19,
                            fontFamily: "PlayfairDisplay",
                            fontWeight: FontWeight.w700),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        IconButton(onPressed: add, icon: const Icon(Icons.add)),
                        Text(count),
                        IconButton(
                            onPressed: remove, icon: const Icon(Icons.remove))
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
