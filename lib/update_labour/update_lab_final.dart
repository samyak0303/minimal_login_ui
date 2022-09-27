import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:minimal_login_ui/Labour/Add/done.dart';
import 'package:minimal_login_ui/transfer_labour/incoming_lab_final.dart';

class UpdateLabourf extends StatefulWidget {
  const UpdateLabourf({super.key});

  @override
  State<UpdateLabourf> createState() => _UpdateLabourfState();
}

class _UpdateLabourfState extends State<UpdateLabourf> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _dayRateController = TextEditingController();
  TextEditingController _nightRateController = TextEditingController();
  TextEditingController _allowanceController = TextEditingController();
  TextEditingController _occuranceController = TextEditingController();

  TextEditingController _accountController = TextEditingController();
  TextEditingController _ifscController = TextEditingController();
  TextEditingController _bankNameController = TextEditingController();
  TextEditingController _holderNameController = TextEditingController();

  int currentStep = 0;
  bool isCompleted = false;
  String _selectedGender = 'male';

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
        backgroundColor: Color(0xffEFE8E3),
        title: Text(
          'Update Lab',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {});

            // Navigator.of(context)
            //     .push(MaterialPageRoute(builder: (context) => MyApp()));
            // do something
          },
        ),
      ),
      body: isCompleted
          ? Done()
          : Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xff84746A),
                ),
              ),
              child: Stepper(
                type: StepperType.horizontal,
                steps: getSteps(),
                currentStep: currentStep,
                onStepTapped: (step) {
                  setState(() {
                    currentStep = step;
                  });
                },
                onStepContinue: () {
                  final isLastStep = currentStep == getSteps().length - 1;
                  if (isLastStep) {
                    setState(() {
                      isCompleted = true;
                    });
                    print('Completed');
                  } else {
                    setState(() {
                      currentStep += 1;
                    });
                  }
                },
                onStepCancel: currentStep == 0
                    ? null
                    : () {
                        setState(() {
                          currentStep -= 1;
                        });
                      },
                controlsBuilder: (Buildcontext, ControlsDetails details) {
                  final isLastStep = currentStep == getSteps().length - 1;
                  return Container(
                    margin: EdgeInsets.only(left: 22),
                    // margin: EdgeInsets.only(top: 1),
                    child: Row(
                      children: [
                        SizedBox(width: 15),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 255),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  fixedSize: Size(
                                      MediaQuery.of(context).size.width * 0.4,
                                      60),
                                  // shape: StadiumBorder(),
                                  primary: Color(0xffFFDEA9)),
                              onPressed: details.onStepContinue,
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (context) => Bankingdetails()));

                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    isLastStep ? 'Finished' : 'Next',
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
                  );
                },
              ),
            ),
    );
  }

  List<Step> getSteps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text(
            'Personal ',
            style: TextStyle(
              color: Color.fromRGBO(147, 75, 0, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            'Details',
            style: TextStyle(
              color: Color.fromRGBO(147, 75, 0, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
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
                        labelText: 'Name',
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
                    child: Padding(
                      padding: const EdgeInsets.only(right: 100),
                      child: TextField(
                        maxLength: 10,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))
                        ],
                        controller: _numberController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff84746A), width: 2.5),
                          ),
                          labelText: 'Phone Number',
                          suffixIcon: IconButton(
                              onPressed: _numberController.clear,
                              icon: Icon(Icons.clear)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Radio<String>(
                        value: 'Male',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      Title(
                        color: Colors.black,
                        child: Text(
                          'Male',
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                      ),
                      SizedBox(width: 20),
                      Radio<String>(
                        value: 'Female',
                        groupValue: _selectedGender,
                        onChanged: (value) {
                          setState(() {
                            _selectedGender = value!;
                          });
                        },
                      ),
                      Title(
                        color: Colors.black,
                        child: Text(
                          'Female',
                          style: GoogleFonts.roboto(fontSize: 20),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff84746A), width: 2.5),
                                    ),
                                    labelText: 'Day Rate',
                                    suffixIcon: IconButton(
                                        onPressed: _dayRateController.clear,
                                        icon: Icon(Icons.clear)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff84746A), width: 2.5),
                                    ),
                                    labelText: 'Night Rate',
                                    suffixIcon: IconButton(
                                        onPressed: _nightRateController.clear,
                                        icon: Icon(Icons.clear)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff84746A), width: 2.5),
                                    ),
                                    labelText: 'Allowance',
                                    suffixIcon: IconButton(
                                        onPressed: _allowanceController.clear,
                                        icon: Icon(Icons.clear)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 3,
                                child: TextField(
                                  decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xff84746A), width: 2.5),
                                    ),
                                    labelText: 'Occurance',
                                    suffixIcon: IconButton(
                                        onPressed: _occuranceController.clear,
                                        icon: Icon(Icons.clear)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 65),
                // Padding(
                //   padding: const EdgeInsets.only(left: 30),
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         fixedSize:
                //             Size(MediaQuery.of(context).size.width * 0.4, 60),
                //         // shape: StadiumBorder(),
                //         primary: Color(0xffFFDEA9)),
                //     onPressed: () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => Bankingdetails()));
                //     },
                //     child: Row(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           'Next',
                //           style: TextStyle(
                //             color: Color.fromRGBO(147, 75, 0, 5),
                //             fontWeight: FontWeight.bold,
                //             fontSize: 18,
                //           ),
                //         ), // <-- Text
                //         SizedBox(
                //           width: 5,
                //         ),
                //         Icon(
                //           // <-- Icon
                //           Icons.arrow_forward,
                //           color: Color.fromRGBO(147, 75, 0, 5),
                //           size: 24.0,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                // SizedBox(height: 25),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text(
            'Banking ',
            style: TextStyle(
              color: Color.fromRGBO(147, 75, 0, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            'Details',
            style: TextStyle(
              color: Color.fromRGBO(147, 75, 0, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    child: TextField(
                      controller: _accountController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff84746A), width: 2.5),
                        ),
                        labelText: 'Account Number',
                        suffixIcon: IconButton(
                            onPressed: _accountController.clear,
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
                      controller: _ifscController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff84746A), width: 2.5),
                        ),
                        labelText: 'IFSC Code',
                        suffixIcon: IconButton(
                            onPressed: _ifscController.clear,
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
                      controller: _bankNameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff84746A), width: 2.5),
                        ),
                        labelText: 'Bank Name',
                        suffixIcon: IconButton(
                            onPressed: _bankNameController.clear,
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
                      controller: _holderNameController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xff84746A), width: 2.5),
                        ),
                        labelText: 'Holder Name',
                        suffixIcon: IconButton(
                            onPressed: _holderNameController.clear,
                            icon: Icon(Icons.clear)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 183),
              ],
            ),
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text(
            'Official',
            style: TextStyle(
              color: Color.fromRGBO(147, 75, 0, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Text(
            'Documents',
            style: TextStyle(
              color: Color.fromRGBO(147, 75, 0, 5),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                image != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 60),
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
                          Icons.file_upload_outlined,
                          color: Color.fromRGBO(147, 75, 0, 5),
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                image1 != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Image.file(
                          File(image1!.path),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Container(
                          height: 200,
                          width: 400,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(30)),
                        ),
                      ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 21),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize:
                            Size(MediaQuery.of(context).size.width * 0.4, 60),
                        // shape: StadiumBorder(),
                        primary: Color(0xffFFDEA9)),
                    onPressed: () {
                      myAlert1();
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Upload Pan',
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
                          Icons.file_upload_outlined,
                          color: Color.fromRGBO(147, 75, 0, 5),
                          size: 24.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ];
}
