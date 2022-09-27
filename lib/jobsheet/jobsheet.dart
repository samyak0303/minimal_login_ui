import 'package:flutter/material.dart';

import '../main.dart';
import '../navbar.dart';

class Jobsheet extends StatelessWidget {
  const Jobsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFAFCFF),
        title: Text('Jobsheet', style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MyApp()));
              // do something
            },
          ),
        ],
      ),
    );
  }
}
