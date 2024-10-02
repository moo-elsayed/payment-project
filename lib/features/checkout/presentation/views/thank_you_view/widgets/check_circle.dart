import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckCircle extends StatelessWidget {
  const CheckCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: const Color(0xffEDEDED),
      child: CircleAvatar(
        radius: 40,
        backgroundColor: const Color(0xff34A853),
        child: SvgPicture.asset('assets/images/s7.svg'),
      ),
    );
  }
}
