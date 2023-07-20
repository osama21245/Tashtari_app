import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favouriteController.dart';

// ignore: must_be_immutable
class CustomfavoriteCard extends GetView<ImpfavourateController> {
  final void Function()? ondelete;
  String title;
  String image;
  String subtitle;
  Size size;
  CustomfavoriteCard(
      {super.key,
      required this.ondelete,
      required this.title,
      required this.size,
      required this.subtitle,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 7),
            child: ListTile(
              trailing: IconButton(
                  onPressed: ondelete,
                  icon: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  )),
              subtitle: Text(
                subtitle,
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
              title: Text(title),
              leading: CachedNetworkImage(
                height: size.height * 0.15,
                fit: BoxFit.fill,
                imageUrl: image,
              ),
            ),
          ),
        ));
  }
}
