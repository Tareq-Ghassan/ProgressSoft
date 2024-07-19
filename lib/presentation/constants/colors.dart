import 'package:flutter/material.dart';

///[redColor] this is the default red color
const Color redColor = Color.fromRGBO(198, 29, 35, 1);

///[royalBlueColor] this is the default royal blue color
/// used mostly in elevated buttons
const Color royalBlueColor = Color.fromRGBO(0, 23, 56, 1);

///[whiteColor] this is the default white color
const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);

///[blackColor] this is the default black color
const Color blackColor = Color.fromRGBO(0, 0, 0, 1);

///[elevatedButtonColor] this is the default elevated button color
const Color elevatedButtonColor = Color.fromRGBO(0, 23, 56, 1);

///[greenColor] this is the default green color
const Color greenColor = Color.fromRGBO(35, 180, 97, 1);

///[blueAppBarGradient] a list of colors which give Blue color Gradient for
///app bar
final blueAppBarGradient = [
  const Color.fromRGBO(7, 44, 72, 1),
  const Color.fromRGBO(0, 23, 56, 1),
];

///[ligthGrayColor] this is the default light gray text color
const Color ligthGrayColor = Color.fromRGBO(31, 31, 31, 0.15);

///[grayColor] this is the default gray text color
const Color grayColor = Color.fromRGBO(31, 31, 31, 0.5);

///[shimmerGradient] this is the default LinearGradient colors used for
///shimmer animation effect
const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1, -0.3),
  end: Alignment(1, 0.3),
);

///[greyGradient] a list of colors which give grey color Gradient
final greyGradient = [
  const Color.fromRGBO(209, 209, 209, 1),
  const Color.fromRGBO(235, 235, 235, 1),
];

///[blueGradient] a list of colors which give Blue color Gradient
final blueGradient = [
  const Color.fromRGBO(95, 84, 160, 1),
  const Color.fromRGBO(17, 157, 172, 1),
];

///[orangeGradient] a list of colors which give Orange color Gradient
final orangeGradient = [
  const Color.fromRGBO(137, 199, 74, 1),
  const Color.fromRGBO(17, 157, 172, 1),
];

///[greenGradient] a list of colors which give Green color Gradient
final greenGradient = [
  const Color.fromRGBO(249, 174, 26, 1),
  const Color.fromRGBO(239, 100, 32, 1),
];

///[yellowColor] this is the default yellow color
const Color yellowColor = Color.fromARGB(255, 255, 209, 0);
