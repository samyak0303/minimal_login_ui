import 'package:flutter/material.dart';

import 'package:minimal_login_ui/m2.dart';

import 'Labour/Home/new_labour.dart';
import 'expenses/expenses.dart';
import 'inventory/inventory.dart';
import 'jobsheet/jobsheet.dart';

class NavBar extends StatelessWidget {
  static const IconData pentagon =
      IconData(0xf0546, fontFamily: 'MaterialIcons');
  static const IconData triangle =
      IconData(0xf87b, fontFamily: 'MaterialIcons');
  final padding = EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber,
      child: Material(
        color: Colors.grey[200],
        child: ListView(
          padding: padding,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Welcome,\nSupervisor Name",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: Text('Menu', style: TextStyle(color: Colors.black)),
              decoration: BoxDecoration(color: Colors.grey[200]),
            ),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 1),
              // color: indexClicked == 1
              //     ? Defaults.drawerItemSelector
              //     : Defaults.drawerItemColor,
            ),
            buildMenuItem(
              text: 'Labour',
              icon: triangle,
              onClicked: () => selectedItem(context, 2),
            ),
            buildMenuItem(
              text: 'Jobsheet',
              icon: Icons.square,
              onClicked: () => selectedItem(context, 3),
            ),
            buildMenuItem(
              text: 'Expenses',
              icon: pentagon,
              onClicked: () => selectedItem(context, 4),
            ),
            buildMenuItem(
              text: 'Inventory',
              icon: Icons.circle,
              onClicked: () => selectedItem(context, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
    // required Color color
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(color: Colors.black),
      ),
      onTap: onClicked,
    );
  }
}

selectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 1:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MyApps()));
      break;

    case 2:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => New_Labour()));
      break;

    case 3:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Jobsheet()));
      break;
    case 4:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Expenses()));
      break;
    case 5:
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Inventory()));
      break;
  }
}
