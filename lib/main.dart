import 'package:flutter/material.dart';
import 'package:minimal_login_ui/advances/advance.dart';
import 'package:minimal_login_ui/m2.dart';

import 'package:minimal_login_ui/salary/salary_lab.dart';
import 'package:minimal_login_ui/test/pops.dart';

import 'package:minimal_login_ui/transfer_labour/incoming_lab_final.dart';

import 'package:minimal_login_ui/transfer_labour/outgoing_lab_final.dart';
import 'package:minimal_login_ui/update_labour/update_lab_final.dart';

import 'login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //  home: LoginPage(),
        home: MyApps());
  }
}
