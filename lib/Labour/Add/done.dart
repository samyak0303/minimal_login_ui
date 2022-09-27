import 'package:flutter/material.dart';
import 'package:minimal_login_ui/m2.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyApps()));
        },
        child: Text('Done'),
      ),
    );
  }
}
