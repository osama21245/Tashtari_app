import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.3,
      width: size.width * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.21),
              child: Container(
                height: size.height * 0.2,
                width: size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    "assets/images/cat.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            // CircleAvatar(
            //   backgroundColor: Colors.white,
            //   backgroundImage: AssetImage(
            //     "assets/images/th-removebg-preview.png",
            //   ),
            // ),
            Positioned(
              right: 65,
              bottom: 0,
              child: SizedBox(
                height: 46,
                width: 46,
                child: TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.white),
                    ),
                    primary: Colors.white,
                    backgroundColor: Color(0xFFF5F6F9),
                  ),
                  onPressed: () {},
                  child: SvgPicture.asset("assets/images/Camera Icon.svg"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
