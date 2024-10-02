import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/widgets/check_circle.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/widgets/custom_dotted_line.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/widgets/thank_you_view_body.dart';
import 'package:payment_project/features/checkout/presentation/views/thank_you_view/widgets/white_circle.dart';

class ThankYouViewCard extends StatelessWidget {
  const ThankYouViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20, bottom: 27),
        child: Stack(clipBehavior: Clip.none, children: [
          const ThankYouViewBody(),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .2,
            left: -35 / 2,
            child: const WhiteCircle(
              radius: 35 / 2,
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .2,
            right: -35 / 2,
            child: const WhiteCircle(
              radius: 35 / 2,
            ),
          ),
          const Positioned(
              top: -50,
              //left: MediaQuery.of(context).size.width * .5 - 60,
              left: 0,
              right: 0,
              child: CheckCircle()),
          Positioned(
            bottom: MediaQuery.of(context).size.height * .2 + 35 / 2,
            left: 0,
            right: 0,
            child: CustomDottedLine(
              lineLength: MediaQuery.of(context).size.width - 90,
            ),
          ),
        ]),
      ),
    );
  }
}
