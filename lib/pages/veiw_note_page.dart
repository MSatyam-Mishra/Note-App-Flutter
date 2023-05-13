import 'package:flutter/material.dart';

import 'package:line_icons/line_icons.dart';
import 'package:todo_app_hive/constants/constant_data.dart';
import 'package:todo_app_hive/constants/design_elements.dart';
import 'package:todo_app_hive/pages/home_page.dart';

import '../widgets/note_tile.dart';

class ViewNotePage extends StatefulWidget {
  const ViewNotePage({super.key});

  @override
  State<ViewNotePage> createState() => _ViewNotePageState();
}

class _ViewNotePageState extends State<ViewNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: noteList[selectedNoteIndex][2],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Hero(
              tag: Homepage(),
              child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(255, 226, 226, 226)
                          .withOpacity(0.5)),
                  child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        LineIcons.times,
                        color: Colors.black,
                      ))),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child: ListView(children: [
              Text(
                noteList[selectedNoteIndex][0],
                maxLines: null,
                style: tileTextHeader,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                noteList[selectedNoteIndex][1],
                style: tileTextContent,
                maxLines: 10000,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
