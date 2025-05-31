import 'package:flutter/material.dart';

abstract class Styles {
  // static TextStyle textStyle20(BuildContext context) {
  //   double screenWidth = MediaQuery.of(context).size.width;

  //   double fontSize = 20;
  //   if (screenWidth > 1200) {
  //     fontSize = 20 * 1.5;
  //   } else if (screenWidth > 600) {
  //     fontSize = 20 * 1.2;
  //   }

  //   return TextStyle(
  //     fontSize: fontSize,
  //     fontWeight: FontWeight.normal,
  //     color: Colors.black,
  //   );
  // }

  static double _responsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth > 1200) {
      return baseSize * 1.5;
    } else if (screenWidth > 600) {
      return baseSize * 1.2;
    }
    return baseSize;
  }

  // Methods to get a responsive TextStyle based on the screen width
  static TextStyle textStyle18(BuildContext context) {
    return TextStyle(
      fontSize: _responsiveFontSize(context, 18),
      fontWeight: FontWeight.w600,
      // fontFamily: 'Calibri',
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle textStyle24(BuildContext context) {
    return TextStyle(
      fontSize: _responsiveFontSize(context, 24),
      fontWeight: FontWeight.bold,
      color: Colors.black,
    );
  }

  static TextStyle textStyle30(BuildContext context) {
    return TextStyle(
      fontSize: _responsiveFontSize(context, 30),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle14(BuildContext context) {
    return TextStyle(
      fontSize: _responsiveFontSize(context, 14),
      fontWeight: FontWeight.normal,
      // fontFamily: 'Calibri',
      fontStyle: FontStyle.italic,
      color: Colors.grey,
    );
  }

  static TextStyle textStyleDate(BuildContext context) {
    return TextStyle(
      fontSize: _responsiveFontSize(context, 16),
      fontWeight: FontWeight.normal,
      // fontFamily: 'Calibri',
      fontStyle: FontStyle.italic,
      color: Colors.black,
    );
  }

  static TextStyle textStyle28(BuildContext context) {
    return TextStyle(
      fontSize: _responsiveFontSize(context, 28),
      fontWeight: FontWeight.w500,
      color: Colors.red,
      // fontFamily: 'Calibri',
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle textStyleRL(BuildContext context) {
    return TextStyle(
      color: const Color.fromARGB(255, 44, 43, 43),
      fontSize: _responsiveFontSize(context, 32),
      fontWeight: FontWeight.bold,
      letterSpacing: 3.5,
      shadows: const [
        Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 3.0,
          color: Color.fromARGB(255, 236, 236, 236),
        ),
        Shadow(
          offset: Offset(1.0, 1.0),
          blurRadius: 8.0,
          color: Color.fromARGB(255, 230, 19, 19),
        ),
      ],
    );
  }
}
