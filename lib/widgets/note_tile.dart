import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:line_icons/line_icons.dart';
import 'package:todo_app_hive/constants/constant_data.dart';

import 'package:todo_app_hive/constants/design_elements.dart';
import 'package:todo_app_hive/pages/home_page.dart';

class NoteTile extends StatelessWidget {
  NoteTile(
      {super.key,
      required this.noteContent,
      required this.noteTilte,
      required this.tileColor,
      required this.type,
      required this.currentIndex});

  String noteTilte;
  String noteContent;
  int currentIndex = selectedNoteIndex;
  Color tileColor;
  String type;

  Homepage homepage = Homepage();
  delete(int index) {
    noteList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: null,
            icon: LineIcons.alternateTrash,
            borderRadius: BorderRadius.circular(35),
            backgroundColor: Color.fromARGB(104, 250, 107, 107),
          ),
        ]),
        child: Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          decoration: BoxDecoration(
              color: tileColor, //add method to select color
              //add color methods
              borderRadius: BorderRadius.circular(35)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(143, 255, 255, 255)),
                      child: Image.asset(
                        "assets/icons/note-book.png",
                        width: 40,
                        height: 40,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: screenWidth * 0.45,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          noteTilte,
                          style: DayMode().noteHeadingStyle,
                          softWrap: false,
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          child: Text(
                            noteContent,
                            maxLines: 1,
                            overflow: TextOverflow.fade,
                            softWrap: false,
                            style: DayMode().noteContentStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(61, 255, 255, 255)),
                padding: const EdgeInsets.all(5),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Color.fromARGB(82, 32, 10, 2),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
