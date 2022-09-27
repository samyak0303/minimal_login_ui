import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:minimal_login_ui/transfer_labour/incoming_lab_final.dart';
import 'package:minimal_login_ui/update_labour/update_lab_final.dart';

import '../main.dart';

class Salaryfinal extends StatefulWidget {
  @override
  State<Salaryfinal> createState() => _SalaryfinalState();
}

class _SalaryfinalState extends State<Salaryfinal> {
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
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => IncomingLabourf()));
            // do something
          },
        ),
        title: Text('Salary', style: TextStyle(color: Colors.black)),
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
              SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  width: 500,
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff84746A), width: 2.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _amountController.text == ''
                        ? Text('Outstanding')
                        : Text(
                            _amountController.text,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 25),
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
              SizedBox(height: 40),
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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => UpdateLabourf()));
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
