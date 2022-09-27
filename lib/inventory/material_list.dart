import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:minimal_login_ui/inventory/currently_used.dart';
import 'package:minimal_login_ui/inventory/in_stock.dart';
import 'package:minimal_login_ui/inventory/need_order.dart';

import '../theme/default.dart';

class Material_List extends StatelessWidget {
  const Material_List({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: buildShrineTheme(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              // alignment: Alignment.topLeft,
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            centerTitle: true,
            backgroundColor: Color(0xffEFE8E3),
            title: Text('Material List', style: TextStyle(color: Colors.black)),
            bottom: TabBar(
              indicatorColor: Colors.black,
              tabs: [
                Tab(text: 'In Stock', icon: Icon(Icons.favorite)),
                Tab(text: 'Currently Used', icon: Icon(Icons.search)),
                Tab(text: 'Need to Order', icon: Icon(Icons.error)),
              ],
            ),
          ),
          body: TabBarView(children: [
            In_stock(),
            Currently_Used(),
            Need_order(),
          ]),
        ),
      ),
    );
  }
}
