import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'package:todo_app_hive/constants/design_elements.dart';
import 'package:todo_app_hive/pages/create_note.dart';
import 'package:todo_app_hive/pages/veiw_note_page.dart';
import 'package:todo_app_hive/widgets/note_tile.dart';

import '../constants/constant_data.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int noteCount = 0;
  int selectedIndex4Delete = 0;
  @override
  void initState() {
    isDark = true;

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButtons(),
      extendBodyBehindAppBar: true,
      appBar:
          AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Hero(
                tag: Homepage(),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isDark == false
                        ? Colors.black
                        : Color.fromARGB(117, 238, 238, 238).withOpacity(0.3),
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isDark = !isDark;
                      });
                    },
                    child: isDark == false
                        ? Icon(
                            LineIcons.adjust,
                            color: Colors.white,
                          )
                        : RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              LineIcons.adjust,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: isDark == true
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bg.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: screenWidth * 0.5,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "My\nNotes",
                    style: isDark == true
                        ? DayMode().bannerheading
                        : DarkMode().bannerheading,
                  ),
                ),
              ),

              //menu such as fav, imprtant, todos, Audio Notes etc
              SizedBox(
                height: 70,
                child: ListView.builder(
                  itemCount: noteType.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                width: 1.5,
                                color: isDark == true
                                    ? Colors.white
                                    : Colors.black)),
                        padding: const EdgeInsets.all(10),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                noteType[index],
                                style: DarkMode().noteHeadingStyle.copyWith(
                                    color: isDark == true
                                        ? Colors.white
                                        : Colors.black),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              index == 0
                                  ? Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: const BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 73, 73, 73),
                                          shape: BoxShape.circle),
                                      child: Text(
                                        noteList.length.toString(),
                                        style: DarkMode()
                                            .noteContentStyle
                                            .copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                    ); //
                  }),
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              //notes section
              Expanded(
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: noteList.length,
                    itemBuilder: (context, index) {
                      selectedNoteIndex = index;
                      return GestureDetector(
                        onTap: () {
                          selectedNoteIndex = index;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewNotePage()));
                        },
                        child: NoteTile(
                            currentIndex: index,
                            noteTilte: noteList[index][0],
                            noteContent: noteList[index][1],
                            tileColor: noteList[index][2],
                            type: noteList[index][3]),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingActionButtons extends StatelessWidget {
  const FloatingActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 80,
          height: 80,
          child: FittedBox(
            child: FloatingActionButton(
                heroTag: CreateNoteScreen(),
                backgroundColor: Color.fromARGB(255, 0, 0, 0),
                elevation: 10,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNoteScreen())),
                child: Icon(Icons.add)),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 80,
          height: 80,
          child: FittedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.grey.shade200.withOpacity(0.5),
                    elevation: 10,
                    onPressed: () {},
                    child: Icon(Icons.mic)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
