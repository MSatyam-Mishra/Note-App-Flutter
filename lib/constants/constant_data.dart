import 'package:flutter/material.dart';

import '../widgets/filter_menu.dart';
import 'design_elements.dart';

late int selectedNoteIndex;
Color selectedColor = tileColor[5];
List noteList = [
  [
    "Welcome to most beautiful Note App",
    "Welcome to the most beautiful Note App, where beauty meets functionality! Our app boasts a stunning UI/UX design that is both sleek and intuitive, making it a pleasure to use. With our app, you can easily jot down notes, organize them in a clean and tidy manner, and even filter them for quick access. Plus, with support for dark and night themes, you can use our app comfortably, day or night. Download now and experience the perfect balance of style and substance with our Note App!",
    tileColor[7],
    noteType[0]
  ]
];

// var selectedIndex = noteList.asMap().entries.map((e) {
//   var index = e.key;
//   var value = e.value;\_))))))))))))))))))))))))))))))))))))))))0000]]]]]]]*999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999999
// });

final headingController = TextEditingController();
final noteContentController = TextEditingController();

//menu list
List menuListGen = [
  FilterMenu(menuIndex: 0),
  FilterMenu(menuIndex: 1),
  FilterMenu(menuIndex: 2),
  FilterMenu(menuIndex: 3),
];
