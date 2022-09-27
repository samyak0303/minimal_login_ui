import 'package:flutter/material.dart';
import 'package:minimal_login_ui/Labour/Add/stepper.dart';
import 'package:minimal_login_ui/navbar.dart';
import 'package:minimal_login_ui/Labour/Home/advances.dart';
import 'package:minimal_login_ui/transfer_labour/incoming_lab_final.dart';
import 'package:minimal_login_ui/update_labour/update_lab_final.dart';

import 'labour_attandance.dart';

class New_Labour extends StatefulWidget {
  const New_Labour({super.key});

  @override
  State<New_Labour> createState() => _New_LabourState();
}

class _New_LabourState extends State<New_Labour> {
  String? dropdownvalue;

  // List of items in our dropdown menu
  var items = [
    'Anish',
    'Rajnee',
    'Samyak',
    'Vaihsnavi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Labour"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 70, //height of button
                  width: MediaQuery.of(context).size.width *
                      0.25, //width of button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Steppers()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text(" Add"),
                      ],
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero))),
                  ),
                ),
                SizedBox(
                  height: 70, //height of button
                  width: MediaQuery.of(context).size.width *
                      0.25, //width of button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IncomingLabourf()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text(" Transfer "),
                      ],
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero))),
                  ),
                ),
                SizedBox(
                  height: 70, //height of button
                  width: MediaQuery.of(context).size.width *
                      0.25, //width of button
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UpdateLabourf()));
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Update "),
                      ],
                    ),
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero))),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 70, //height of button
                    width: MediaQuery.of(context).size.width *
                        0.25, //width of button
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text(" List"),
                        ],
                      ),
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: EdgeInsets.all(25),
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.mark_chat_read_outlined),
                      SizedBox(width: 5),
                      Text(
                        'Mark Attandance',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LabourAttendance()));
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: ElevatedButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.currency_rupee),
                      SizedBox(width: 5),
                      Text(
                        'Advances',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Advances()));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25, bottom: 20),
                  child: DropdownButton(
                    hint: Text('Show Details'),
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),

                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
