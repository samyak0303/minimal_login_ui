import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import '../widget/labour_card.dart';

class Currently_Used extends StatelessWidget {
  const Currently_Used({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 175),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            width: 300,
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
          widgetintended: SizedBox(
            width: 2,
          ),
        ),
        Labourcard(
          name: 'Labour Name',
          description: 'Jobsheet Title',
          widgetintended: SizedBox(
            width: 2,
          ),
        )
      ],
    );
  }
}
