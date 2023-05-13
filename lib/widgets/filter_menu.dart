import 'package:flutter/material.dart';

import 'package:todo_app_hive/constants/design_elements.dart';
import 'package:todo_app_hive/pages/home_page.dart';

class FilterMenu extends StatelessWidget {
  FilterMenu({super.key, required this.menuIndex});
  int menuIndex;
  int selectedColorIndex = 0;
  int noteCount = 0;
  Homepage homePage = Homepage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
                width: 1.5,
                color: isDark == true ? Colors.white : Colors.black)),
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Row(
            children: [
              Text(
                noteType[menuIndex],
                style: DarkMode().noteHeadingStyle.copyWith(
                    color: isDark == true ? Colors.white : Colors.black),
              ),
              const SizedBox(
                width: 5,
              ),
              menuIndex == 0
                  ? Container(
                      padding: const EdgeInsets.all(7),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 73, 73, 73),
                          shape: BoxShape.circle),
                      child: Text(
                        noteCount.toString(),
                        style: DarkMode().noteContentStyle.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
