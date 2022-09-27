import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PopUpWindow extends StatefulWidget {
  const PopUpWindow({super.key});

  @override
  State<PopUpWindow> createState() => _PopUpWindowState();
}

class _PopUpWindowState extends State<PopUpWindow> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _materialController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

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
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
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
                      getImage(ImageSource.camera);
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
        title: Text("Flutter"),
      ),
      body: Center(
          child: TextButton(
        child: Text("Open Popup"),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text('Login'),
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
                                    color: Color(0xff84746A), width: 2.5),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 30),
                                image != null
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Image.file(
                                          File(image!.path),
                                          fit: BoxFit.cover,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 200,
                                        ),
                                      )
                                    : Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Container(
                                          height: 200,
                                          width: 400,
                                          decoration: BoxDecoration(
                                              color: Colors.grey.shade300,
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                        ),
                                      ),
                                SizedBox(height: 20),
                                Padding(
                                  padding: const EdgeInsets.only(left: 21),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                            60),
                                        primary: Color(0xffFFDEA9)),
                                    onPressed: () {
                                      myAlert();
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Upload Aadhar',
                                          style: TextStyle(
                                            color:
                                                Color.fromRGBO(147, 75, 0, 5),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ), // <-- Text
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          // <-- Icon
                                          Icons.file_upload_outlined,
                                          color: Color.fromRGBO(147, 75, 0, 5),
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
                                    color: Color(0xff84746A), width: 2.5),
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
                          TextFormField(
                            controller: _quantityController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xff84746A), width: 2.5),
                              ),
                              labelText: 'Quantity',
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    _quantityController.clear();
                                  },
                                  icon: Icon(Icons.clear)),
                              // icon: Icon(Icons.account_box),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        child: Text("Submit"),
                        onPressed: () {
                          // your code
                        })
                  ],
                );
              });
        },
      )),
    );
  }
}
