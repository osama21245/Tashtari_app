import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

// ignore: must_be_immutable
class customCheckoutCard extends StatelessWidget {
  String title;
  String subtitle;
  bool condetion;
  final void Function()? onpressed;
  customCheckoutCard(
      {super.key,
      required this.condetion,
      required this.subtitle,
      required this.title,
      required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          color: condetion == true ? AppColor.primaryColor : null,
          child: ListTile(
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on_outlined,
                  color:
                      condetion == true ? Colors.white : AppColor.primaryColor,
                )),
            title: Text(
              title,
              style: condetion == true
                  ? const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )
                  : null,
            ),
            subtitle: Text(
              subtitle,
              style: condetion == true
                  ? const TextStyle(color: Colors.white)
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
