import 'package:flutter/material.dart';
import 'dart:ui' as ui;

//controllers

final screenWidth = (ui.window.physicalSize.width / ui.window.devicePixelRatio);
final screenHeight =
    (ui.window.physicalSize.height / ui.window.devicePixelRatio);
final safePaddingTop = WidgetsBinding.instance.window.padding.top;
final safePaddingBottom = WidgetsBinding.instance.window.padding.top;

TextStyle tileTextHeader = TextStyle(
  fontSize: 30,
  fontFamily: "Montserrat",
  fontWeight: FontWeight.bold,
);

TextStyle tileTextContent = TextStyle(
  fontSize: 25,
  fontFamily: "Montserrat",
);

class DayMode {
  TextStyle bannerheading = const TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w500);

  TextStyle noteHeadingStyle = const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.bold);

  TextStyle noteContentStyle = const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.normal);
}

///////////////Dark Colors

class DarkMode {
  TextStyle bannerheading = const TextStyle(
      fontSize: 32,
      color: Colors.black,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w700);

  TextStyle noteHeadingStyle = const TextStyle(
      fontSize: 20,
      color: Colors.black,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.bold);

  TextStyle noteContentStyle = const TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.normal);
}
/////////////////////colors

List<Color> tileColor = [
  Color(0xFFe97a55),
  Color(0xfff6d34f),
  Color(0xfff5ebc9),
  Color(0xffa7d573),
  Color.fromARGB(255, 143, 144, 233),
  Color.fromARGB(255, 233, 187, 143),
  Color.fromARGB(255, 233, 143, 199),
  Color.fromARGB(255, 143, 223, 233),
];
Color notecretaionBg = Color.fromARGB(255, 255, 250, 234);

List<String> noteType = ["all", "Important", "Favourite", "ToDo"];

class ColoredCircle extends StatelessWidget {
  ColoredCircle({super.key, required this.colorNumber});
  int colorNumber;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 10,
      height: 40,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: tileColor[colorNumber]),
    );
  }
}

bool isDark = true;
