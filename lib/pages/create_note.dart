import 'package:flutter/material.dart';
import 'package:todo_app_hive/constants/constant_data.dart';
import 'package:todo_app_hive/constants/design_elements.dart';

class CreateNoteScreen extends StatefulWidget {
  CreateNoteScreen({super.key});

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  bool isColorPalett = false;

  //delete fn
  // deleteNoteFn(int index) {
  //   setState(() {
  //     noteList.removeAt(index);
  //   });
  //}

//Save Notes
  saveNote() {
    setState(() {
      noteList.add([
        headingController.text,
        noteContentController.text,
        selectedColor,
        noteType[1],
      ]);
    });

    noteContentController.clear();
    headingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: notecretaionBg,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 70,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/icons/back.png",
              color: Colors.black,
              width: 40,
              height: 40,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 226, 226, 226)
                        .withOpacity(0.5)),
                child: InkWell(
                  onTap: () {
                    saveNote();
                    print(selectedColor);
                    print(headingController.text.toString());
                    print(noteContentController.text.toString());
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/icons/save.png",
                    color: Colors.black,
                  ),
                )),
          )
        ],
      ),
      body: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Stack(
            children: [
              ListView(children: [
                Flexible(
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Note Heading"),
                    style: tileTextHeader,
                    controller: headingController,
                  ),
                ),
                SizedBox(
                  height: screenHeight,
                  child: TextField(
                      maxLines: null,
                      controller: noteContentController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Note content"),
                      style: tileTextContent),
                ),
              ]),
              (isColorPalett == true)
                  ? Positioned(
                      left: 0,
                      right: 50,
                      bottom: 0,
                      child: SizedBox(
                        width: screenWidth,
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: tileColor.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 5.0, right: 5),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedColor = tileColor[index];
                                      });
                                    },
                                    child: ColoredCircle(colorNumber: index)),
                              );
                            }),
                      ))
                  : Container(),
              Positioned(
                  left: screenWidth * 0.8,
                  right: 5,
                  bottom: 22,
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.transparent),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isColorPalett = !isColorPalett;
                          });
                        },
                        child: Image.asset(
                          "assets/icons/color_palett.png",
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

/*
AppBar(
          toolbarHeight: 70,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back_ios,color: Colors.black,),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          Color.fromARGB(255, 226, 226, 226).withOpacity(0.5)),
                  child: Image.asset(
                    "assets/icons/save.png",
                    width: 30,
                    height: 30,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ]),
 */
/*

  ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tileColor.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 5.0, right: 5),
                    child: ColoredCircle(colorNumber: index),
                  );
                }),

 */