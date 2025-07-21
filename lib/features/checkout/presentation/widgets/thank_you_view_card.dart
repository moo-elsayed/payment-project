import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_project/features/checkout/presentation/widgets/check_circle.dart';
import 'package:payment_project/features/checkout/presentation/widgets/custom_dotted_line.dart';
import 'package:payment_project/features/checkout/presentation/widgets/thank_you_view_body.dart';
import 'package:payment_project/features/checkout/presentation/widgets/white_circle.dart';

class ThankYouViewCard extends StatelessWidget {
  const ThankYouViewCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(
          left: 20.0,
          right: 20,
          bottom: 27,
          top: kToolbarHeight,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            ThankYouViewBody(height: sizeOfScreen.height),
            Positioned(
              bottom: sizeOfScreen.height * .2,
              left: -35 / 2,
              child: const WhiteCircle(radius: 35 / 2),
            ),
            Positioned(
              bottom: sizeOfScreen.height * .2,
              right: -35 / 2,
              child: const WhiteCircle(radius: 35 / 2),
            ),
            const Positioned(
              top: -50,
              //left: sizeOfScreen.width * .5 - 60,
              left: 0,
              right: 0,
              child: CheckCircle(),
            ),
            Positioned(
              bottom: sizeOfScreen.height * .2 + 35 / 2,
              left: 0,
              right: 0,
              child: CustomDottedLine(lineLength: sizeOfScreen.width - 90),
            ),
            Positioned(
              left: 0,
              top: -36,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset('assets/images/arrow_back.svg'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
