import 'package:flutter/material.dart';
import '../widget/labour_card.dart';

class Order_History extends StatefulWidget {
  @override
  State<Order_History> createState() => _Order_HistoryState();
}

class _Order_HistoryState extends State<Order_History> {
  int deletetestvarialbe = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        centerTitle: true,
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 15),
          child: Divider(color: Colors.black),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Order ID",
              style: TextStyle(fontSize: 15, color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Site Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Amount",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Delivery Status/Delivery Date",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Labourcard(
          name: 'Material Name',
          description: 'Jobsheet Title',
          widgetintended: SizedBox(
            width: 2,
          ),
        ),
      ]),
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
