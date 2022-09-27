import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minimal_login_ui/inventory/inventory.dart';
import 'dart:io';
import '../widget/labour_card.dart';
import 'package:dropdown_search/dropdown_search.dart';

class Place_Order extends StatefulWidget {
  const Place_Order({super.key});

  @override
  State<Place_Order> createState() => _Place_OrderState();
}

class _Place_OrderState extends State<Place_Order> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _materialController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _nametoolController = TextEditingController();
  TextEditingController _quantitytoolController = TextEditingController();
  TextEditingController _materialtoolController = TextEditingController();
  int deletetestvarialbe = 0;

  XFile? image;
  XFile? image1;

  final ImagePicker picker = ImagePicker();

  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  Future getImage1(ImageSource media) async {
    var img1 = await picker.pickImage(source: media);

    setState(() {
      image1 = img1;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        getImage(ImageSource.gallery);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                        getImage(ImageSource.camera);
                      });
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void myAlert1() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage1(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage1(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffEFE8E3),
        centerTitle: true,
        title: Text("Place Order"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 85),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  style: TextButton.styleFrom(
                    side: BorderSide(width: 1),
                  ),
                  child: Text(
                    "Add New Material",
                    style: TextStyle(color: Color(0xff52443B)),
                  ),
                  onPressed: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,
                            title: Text('Place Order'),
                            content: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Form(
                                child: Column(
                                  children: <Widget>[
                                    TextFormField(
                                      controller: _nameController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff84746A),
                                              width: 2.5),
                                        ),
                                        labelText: 'Name',
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              _nameController.clear();
                                            },
                                            icon: Icon(Icons.clear)),
                                        // icon: Icon(Icons.account_box),
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 30),
                                          image != null
                                              ? Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 20),
                                                  child: Image.file(
                                                    File(image!.path),
                                                    fit: BoxFit.cover,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 200,
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5),
                                                  child: Container(
                                                    height: 200,
                                                    width: 400,
                                                    decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade300,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30)),
                                                  ),
                                                ),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 21),
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  fixedSize: Size(
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width *
                                                          0.4,
                                                      60),
                                                  primary: Color(0xffFFDEA9)),
                                              onPressed: () {
                                                setState(() {
                                                  myAlert();
                                                });
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Upload Aadhar',
                                                    style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          147, 75, 0, 5),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ), // <-- Text
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Icon(
                                                    // <-- Icon
                                                    Icons.file_upload_outlined,
                                                    color: Color.fromRGBO(
                                                        147, 75, 0, 5),
                                                    size: 24.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextFormField(
                                      controller: _materialController,
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xff84746A),
                                              width: 2.5),
                                        ),
                                        labelText: 'Material',
                                        suffixIcon: IconButton(
                                            onPressed: () {
                                              _materialController.clear();
                                            },
                                            icon: Icon(Icons.clear)),
                                        // icon: Icon(Icons.account_box),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                  child: Text("Submit"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    // your code
                                  })
                            ],
                          );
                        },
                      );
                    });
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: DropdownSearch<String>.multiSelection(
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "Search Material",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff84746A), width: 1.5),
                  ),
                ),
              ),
              items: ['Material1', 'Material2', 'Material3', 'Material4'],
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                // disabledItemFn: (String s) => s.startsWith('I'),
              ),
              onChanged: print,
              // selectedItems: ["Brazil"],
            ),
          ),
          Labourcard(
            name: 'Tool Name',
            description: 'Material Description',
            widgetintended: adddeletebox(),
          ),
          Labourcard(
            name: 'Tool Name',
            description: 'Material Description',
            widgetintended: adddeletebox(),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: DropdownSearch<String>.multiSelection(
              dropdownDecoratorProps: DropDownDecoratorProps(
                dropdownSearchDecoration: InputDecoration(
                  hintText: "Delivery Location",
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color(0xff84746A), width: 1.5),
                  ),
                ),
              ),
              items: ['Pune', 'Nagpur', 'Nashik', 'Mumbai', 'Lonavla'],
              popupProps: PopupPropsMultiSelection.menu(
                showSelectedItems: true,
                // disabledItemFn: (String s) => s.startsWith('I'),
              ),
              onChanged: print,
              // selectedItems: ["Brazil"],
            ),
          ),
          SizedBox(height: 300),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(width: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 270, right: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 60),
                        // shape: StadiumBorder(),
                        primary: Color(0xffFFDEA9)),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Inventory()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'ADD',
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
                          Icons.arrow_forward,
                          color: Color.fromRGBO(147, 75, 0, 5),
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget adddeletebox() {
    return Container(
      padding: EdgeInsets.zero,
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
        width: 100,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              child: Icon(Icons.remove),
              onTap: () {
                setState(() {
                  if (deletetestvarialbe > 0) {
                    deletetestvarialbe = deletetestvarialbe - 1;
                    print('Cant be less than zero');
                  }
                  print('Subtracted');
                });
              },
            ),
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
            InkWell(
              child: Icon(Icons.add),
              onTap: () {
                setState(() {
                  deletetestvarialbe = deletetestvarialbe + 1;
                  print('Added');
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
