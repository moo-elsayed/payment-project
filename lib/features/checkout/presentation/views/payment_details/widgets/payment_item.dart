import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem(
      {super.key, required this.isActive, required this.assetName, required this.count});

  final bool isActive;
  final String assetName;
  final int count;

  @override
  Widget build(BuildContext context) {
    // return isActive
    //     ? ActivePaymentItem(assetName: assetName)
    //     : InActivePaymentItem(assetName: assetName);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 63,
      width: (MediaQuery.of(context).size.width - (40 + (count - 1) * 20)) / count,
      /*
      (MediaQuery.of(context).size.width - (40 + ((count - 1) * 20))) /
          (count + 1),
      */
      decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
                color: isActive ? const Color(0xff34A853) : Colors.white,
                offset: const Offset(0, 0),
                blurRadius: isActive ? 4 : 0,
                spreadRadius: 0),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: isActive ? 1.5 : 1,
                color: isActive
                    ? const Color(0xff34A853)
                    : const Color(0xff808080)),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          )),
      child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          child: Center(child: SvgPicture.asset(assetName))),
    );
  }
}

class ActivePaymentItem extends StatelessWidget {
  const ActivePaymentItem({super.key, required this.assetName, required this.count});

  final String assetName;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: (MediaQuery.of(context).size.width - 80) / count,
      decoration: const ShapeDecoration(
          shadows: [
            BoxShadow(
                color: Color(0xff34A853),
                offset: Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0),
          ],
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.5, color: Color(0xff34A853)),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          )),
      child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          child: Center(child: SvgPicture.asset(assetName))),
    );
  }
}

class InActivePaymentItem extends StatelessWidget {
  const InActivePaymentItem({super.key, required this.assetName, required this.count});

  final String assetName;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63,
      width: (MediaQuery.of(context).size.width - 80) / count,
      decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
        side: BorderSide(width: 1, color: Color(0xff808080)),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      )),
      child: Container(
          decoration: const ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          child: Center(child: SvgPicture.asset(assetName))),
    );
  }
}
