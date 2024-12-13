import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartage_care/constants/sizes.dart';
import 'package:smartage_care/widgets/wide_button.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: smartAgeDefaultSize,
              horizontal: smartAgeDefaultSize * 0.75,
            ),
            child: Text(
              "dashBoardAlert".tr,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: smartAgeDefaultSize,
              horizontal: smartAgeDefaultSize * 0.75,
            ),
            child: Image.asset(
              'assets/images/pic1.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: smartAgeDefaultSize*0.1,
              horizontal: smartAgeDefaultSize * 1,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WideButton(
                  design: ButtonDesign.secondary,
                  onPressed: () {},
                  text: 'Questionaire Finished', width: 200,
                  disabled: true,
                ),
                WideButton(
                  design: ButtonDesign.secondary,
                  onPressed: () {},
                  text: 'Dismiss', width: 100,
                  disabled: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
