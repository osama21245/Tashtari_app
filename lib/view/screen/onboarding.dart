import 'package:flutter/material.dart';

import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customslider.dart';
import '../widget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
              child: Column(
            children: [
              Expanded(flex: 7, child: CustomSliderOnBoarding(size)),
              SizedBox(
                height: size.height * 0.04,
              ),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const CustomDotControllerOnBoarding(),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      CustomButtonOnBoarding(size)
                    ],
                  ))
            ],
          )),
        ));
  }
}
