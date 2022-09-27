import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../widget/labour_card.dart';

class Currently_Used extends StatefulWidget {
  const Currently_Used({super.key});

  @override
  State<Currently_Used> createState() => _Currently_UsedState();
}

class _Currently_UsedState extends State<Currently_Used> {
  @override
  int deletetestvarialbe = 0;
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 175),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            // width: 200,
            child: DropdownSearch<String>.multiSelection(
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "Site Name",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff84746A), width: 1.5),
                  ),
                ),
              ),
              items: ['Site1', 'Site2', 'Site3', 'Site4'],
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                // disabledItemFn: (String s) => s.startsWith('I'),
              ),
              onChanged: print,
              // selectedItems: ["Brazil"],
            ),
          ),
        ),
        Labourcard(
            name: 'Labour Name',
            description: 'Jobsheet Title',
            widgetintended: shownumber()),
        Labourcard(
            name: 'Labour Name',
            description: 'Jobsheet Title',
            widgetintended: shownumber()),
        Divider(color: Colors.grey),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Equipments",
            ),
          ],
        ),
      ],
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
