import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:minimal_login_ui/salary/salary_lab.dart';

import '../Labour/Add/stepper.dart';
import '../main.dart';

class Advances_S extends StatefulWidget {
  @override
  State<Advances_S> createState() => _Advances_SState();
}

class _Advances_SState extends State<Advances_S> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  TextEditingController dateInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffFAFCFF),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => Salaryfinal()));
            // do something
          },
        ),
        title: Text('Advance', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff84746A), width: 2.5),
                      ),
                      labelText: 'Labour Name',
                      suffixIcon: IconButton(
                          onPressed: _nameController.clear,
                          icon: Icon(Icons.clear)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: TextField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff84746A), width: 2.5),
                      ),
                      labelText: 'Amount',
                      suffixIcon: IconButton(
                          onPressed: _amountController.clear,
                          icon: Icon(Icons.clear)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  child: TextField(
                    controller: _reasonController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff84746A), width: 2.5),
                      ),
                      labelText: 'Reason',
                      suffixIcon: IconButton(
                          onPressed: _reasonController.clear,
                          icon: Icon(Icons.clear)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  child: TextField(
                    controller: dateInput,
                    //editing controller of this TextField
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xff84746A), width: 2.5),
                      ),
                      // icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date", //label text of field
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1950),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2100));

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        setState(() {
                          dateInput.text =
                              formattedDate; //set output date to TextField value.
                        });
                      } else {}
                    },
                  ),
                ),
              ),
              SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(MediaQuery.of(context).size.width * 0.45, 60),
                      // shape: StadiumBorder(),
                      primary: Color(0xffFFDEA9)),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Steppers()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Confirm Transfer',
                        style: TextStyle(
                          color: Color.fromRGBO(147, 75, 0, 5),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ), // <-- Text
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        // <-- Icon
                        Icons.arrow_forward,
                        color: Color.fromRGBO(147, 75, 0, 5),
                        size: 24.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
