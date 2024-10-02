import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/styles.dart';

AppBar customAppBar({String? text, Function()? onTap}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Center(
        child: GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset('assets/images/arrow_back.svg'))),
    centerTitle: true,
    title: Text(
      text ?? '',
      style: Styles.styleMedium25(),
    ),
  );
}
