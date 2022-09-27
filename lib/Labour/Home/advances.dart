import 'package:flutter/material.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';

class Advances extends StatefulWidget {
  const Advances({Key? key}) : super(key: key);

  @override
  State<Advances> createState() => _AdvancesState();
}

class _AdvancesState extends State<Advances> {
  late SingleValueDropDownController _cnt;

  @override
  void initState() {
    _cnt = SingleValueDropDownController();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advances'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.add),
                  Text(
                    'Add Advances',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                minimumSize: const Size(150, 40),
                maximumSize: const Size(150, 40),
              ),
              onPressed: () {
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => Advances()));
              },
            ),
            SizedBox(
              height: 20,
            ),
            DropDownTextField(
              // initialValue: "name4",
              singleController: _cnt,
              clearOption: false,
              enableSearch: true,
              validator: (value) {
                if (value == null) {
                  return "Required field";
                } else {
                  return null;
                }
              },
              dropDownItemCount: 3,
              dropDownList: const [
                DropDownValueModel(
                    name:
                        '1: Rs.99999                                     %labour Name\nDate: 8/9/2022\nReason:()',
                    value: "value1"),
                DropDownValueModel(
                    name:
                        '2: Rs.99999                                     %labour Name\nDate: 8/9/2022\nReason:()',
                    value: "value2",
                    toolTipMsg:
                        "DropDownButton is a widget that we can use to select one unique value from a set of values"),
                DropDownValueModel(
                  name:
                      '3: Rs.99999                                     %labour Name\nDate: 8/9/2022\nReason:()',
                  value: "value3",
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
