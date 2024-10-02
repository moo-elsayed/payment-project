import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle styleRegular5_2() {
    return const TextStyle(
      fontFamily: 'Inter',
      color: Color(0xff000000),
      fontSize: 5.2,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleMedium12_4() {
    return const TextStyle(
      color: Color(0xff000000),
      fontSize: 12.4,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold12_4() {
    return const TextStyle(
      color: Color(0xff000000),
      fontFamily: 'Inter',
      fontSize: 12.4,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular18() {
    return const TextStyle(
      color: Color(0xff000000),
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold18() {
    return const TextStyle(
      color: Color(0xff000000),
      fontSize: 18,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular20() {
    return TextStyle(
      color: const Color(0xff000000).withOpacity(.8),
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold20() {
    return const TextStyle(
      color: Color(0xff000000),
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium22() {
    return const TextStyle(
      color: Color(0xff000000),
      fontFamily: 'Inter',
      fontSize: 22,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle styleSemiBold24() {
    return const TextStyle(
      color: Color(0xff000000),
      fontSize: 24,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleMedium25() {
    return const TextStyle(
      color: Color(0xff000000),
      fontFamily: 'Inter',
      fontSize: 25,
      fontWeight: FontWeight.w600,
    );
  }
}
