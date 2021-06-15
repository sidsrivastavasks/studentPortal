import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:csp/service/constant.dart';
import 'package:http/http.dart' as http;
import 'package:csp/service/user_auth.dart';

class StudentRegistration extends StatefulWidget {
  @override
  _StudentRegistrationState createState() => _StudentRegistrationState();
}

class _StudentRegistrationState extends State<StudentRegistration> {
  bool changeButton = false;
  // List<String> selectedItemValue = List<String>();
  // int pp = 1;
  var _sec = "Sec";
  var _streamname = "Stream";
  var _semno = "Sem";
  String name;
  int roll;
  String email;
  int phone;
  int sem;
  String stream;
  String sec;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map student = ModalRoute.of(context).settings.arguments;
    return Padding(
      padding: EdgeInsets.all(size.height > 770
          ? 64
          : size.height > 670
              ? 32
              : 16),
      child: Center(
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            height: size.height *
                (size.height > 770
                    ? 0.7
                    : size.height > 670
                        ? 0.8
                        : 0.9),
            width: 500,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 20.9,
                  ),
                  Text(
                    "Student Registration",
                    style: registrationTextheadingstyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                              onChanged: (value) {
                                name = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Name",
                                hintStyle: registrationTextstyle,
                                labelText: "Name",
                                labelStyle: registrationTextstyle,
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Name cannot be Empty";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 3.0,
                          ),
                          TextFormField(
                              onChanged: (value) {
                                roll = int.parse(value);
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Roll No",
                                hintStyle: registrationTextstyle,
                                labelText: "Roll No",
                                labelStyle: registrationTextstyle,
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Roll No Cannot be Empty";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 3.0,
                          ),
                          TextFormField(
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                hintStyle: registrationTextstyle,
                                labelText: "Email",
                                labelStyle: registrationTextstyle,
                              ),
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Email cannot be Empty";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 3.0,
                          ),
                          // TextFormField(
                          //   onChanged: (value) {
                          //     password = value;
                          //   },
                          //   obscureText: true,
                          //   decoration: InputDecoration(
                          //     hintText: "Enter Password",
                          //     hintStyle: registrationTextstyle,
                          //     labelText: "Password",
                          //     labelStyle: registrationTextstyle,
                          //   ),
                          //   validator: (value) {
                          //     if (value.isEmpty) {
                          //       return "Password cannot be Empty";
                          //     } else if (value.length < 6) {
                          //       return "Password Length should be atleast 6";
                          //     }
                          //     return null;
                          //   },
                          // ),
                          // SizedBox(
                          //   height: 3.0,
                          // ),
                          TextFormField(
                              onChanged: (value) {
                                phone = int.parse(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter Phone Number",
                                hintStyle: registrationTextstyle,
                                labelText: "Phone Number",
                                labelStyle: registrationTextstyle,
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Phone Number Cannot be Empty";
                                } else if (value.length != 10) {
                                  return "Invalid Phone Number";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 3.0,
                          ),
                          // TextFormField(
                          //     keyboardType: TextInputType.number,
                          //     decoration: InputDecoration(
                          //       hintText: "Enter Semester",
                          //       hintStyle: registrationTextstyle,
                          //       labelText: "Semester",
                          //       labelStyle: registrationTextstyle,
                          //     ),
                          //     validator: (value) {
                          //       if (value.isEmpty) {
                          //         return "Phone Number Cannot be Empty";
                          //       } else if (value.length != 10) {
                          //         return "Invalid Phone Number";
                          //       }
                          //       return null;
                          //     }),
                          DropdownButton(
                            items: _dropDownItemSem(),
                            onChanged: (value) {
                              setState(() {
                                sem = int.parse(value);
                                print(sem);
                                print(sem.runtimeType);
                                _semno = value;
                              });
                            },
                            value: _semno,
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          DropdownButton(
                            // value: 'Stream',
                            // value: selectedItemValue[index].toString(),
                            items: _dropDownItemStream(),
                            onChanged: (value) {
                              stream = value;
                              // selectedItemValue[index] = value;
                              setState(() {
                                _streamname = value;
                              });
                            },
                            value: _streamname,
                          ),
                          SizedBox(
                            height: 3.0,
                          ),
                          DropdownButton(
                            // value: "Semester",
                            items: _dropDownItemSec(),
                            onChanged: (value) {
                              sec = value;
                              // selectedItemValue[index] = value;
                              setState(() {
                                _sec = value;
                              });
                            },
                            value: _sec,
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  changeButton = true;
                                });
                                // await Future.delayed(Duration(seconds: 1));
                                // await Alert(
                                //   context: context,
                                //   title: ' Registered ',
                                //   desc: 'Student Registered Successfully',
                                // ).show();
                                http.Response response =
                                    await studentregistration(
                                  name,
                                  roll,
                                  email,
                                  phone,
                                  sem,
                                  stream,
                                  sec,
                                  student['token'],
                                );
                                print(response.statusCode);
                                String data = response.body;
                                dynamic decodedData = jsonDecode(data);
                                if (response.statusCode == 201) {
                                  setState(() {
                                    changeButton = false;
                                  });
                                  Alert(
                                    context: context,
                                    title: decodedData['detail'],
                                    desc: decodedData['id'],
                                  ).show();
                                } else {
                                  setState(() {
                                    changeButton = false;
                                  });
                                  Alert(
                                    context: context,
                                    title: decodedData['detail']['title'],
                                    desc: decodedData['detail']['description'],
                                  ).show();
                                }
                                setState(() {
                                  changeButton = false;
                                });
                              }
                            },
                            child: AnimatedContainer(
                              duration: Duration(seconds: 1),
                              width: changeButton ? 50 : 130.0,
                              height: 50.0,
                              alignment: Alignment.center,
                              child: changeButton
                                  ? Icon(
                                      Icons.done,
                                      color: Colors.white,
                                    )
                                  : Text(
                                      'Register',
                                      style: TextStyle(
                                        fontFamily: 'Oxygen',
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    changeButton ? 50 : 8),
                                color: Colors.deepPurple,
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
          ),
        ),
      ),
    );
  }
}

List<DropdownMenuItem<String>> _dropDownItemSec() {
  List<String> ddl = [
    "Sec",
    "A",
    "B",
    "N.A",
  ];
  return ddl
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}

List<DropdownMenuItem<String>> _dropDownItemStream() {
  List<String> ddl = [
    "Stream",
    "CSE",
    "IT",
    "ECE",
    "BT",
  ];
  return ddl
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}

List<DropdownMenuItem<String>> _dropDownItemSem() {
  List<String> dd = [
    'Sem',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
  ];
  return dd
      .map((value) => DropdownMenuItem(
            value: value,
            child: Text(value),
          ))
      .toList();
}
