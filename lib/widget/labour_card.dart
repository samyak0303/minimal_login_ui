// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Labourcard extends StatefulWidget {
  const Labourcard({
    Key? key,
    required this.name,
    required this.description,
    required this.widgetintended,
  }) : super(key: key);
  final String name;
  final String description;
  final Widget widgetintended;

  @override
  State<Labourcard> createState() => _LabourcardState();
}

class _LabourcardState extends State<Labourcard> {
  bool? checkbox1 = false;
  bool? checkbox2 = true;
  int deletetestvarialbe = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Material(
          child: Card(
            color: Color.fromARGB(198, 250, 252, 255),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            shadowColor: Colors.black,
            elevation: 15.0,
            child: Container(
              padding: EdgeInsets.all(5),
              height: 90,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(250, 147, 75, 0),
                      foregroundColor: Colors.white,
                      child: Text(
                        widget.name[0],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 35, 35, 35)),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  // Container(
                  //   padding: EdgeInsets.zero,
                  //   child: Row(
                  //     children: [
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Text('DAY'),
                  //           Checkbox(
                  //             value: checkbox1,
                  //             onChanged: (bool? checkbox1) {
                  //               setState(() {
                  //                 this.checkbox1 = checkbox1;
                  //               });
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //       SizedBox(width: 20),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.end,
                  //         children: [
                  //           Text('NIGHT'),
                  //           Checkbox(
                  //             value: checkbox2,
                  //             onChanged: (bool? checkbox2) {
                  //               setState(() {
                  //                 this.checkbox2 = checkbox2;
                  //               });
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  widget.widgetintended
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget adddeletebox() {
    return Container(
      padding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 222, 169),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromARGB(255, 255, 222, 169),
            width: 5,
          ),
        ),
        width: 100,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Icon(Icons.remove),
              onTap: () {
                setState(() {
                  if (deletetestvarialbe > 0) {
                    deletetestvarialbe = deletetestvarialbe - 1;
                    print('Cant be less than zero');
                  }
                  print('Subtracted');
                });
              },
            ),
            InkWell(
              child: Text(
                deletetestvarialbe.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                setState(() {
                  deletetestvarialbe = 0;
                  print(deletetestvarialbe);
                });
              },
            ),
            InkWell(
              child: Icon(Icons.add),
              onTap: () {
                setState(() {
                  deletetestvarialbe = deletetestvarialbe + 1;
                  print('Added');
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget shownumber() {
    return Container(
      padding: EdgeInsets.only(left: 100),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 222, 169),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color.fromARGB(255, 255, 222, 169),
            width: 5,
          ),
        ),
        width: 50,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Text(
                deletetestvarialbe.toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                setState(() {
                  deletetestvarialbe = 0;
                  print(deletetestvarialbe);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
