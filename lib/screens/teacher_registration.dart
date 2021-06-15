import 'package:csp/service/subjectList.dart';
import 'package:csp/service/subjects.dart';
import 'package:csp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csp/service/user_auth.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool changeButton = false;
  String name;
  String email;
  int phone;
  Map<String, String> map1;

  final _formKey = GlobalKey<FormState>();
  List<String> selectedItemValue = List<String>();
  List subjects;
  int pp = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map teacher = ModalRoute.of(context).settings.arguments;
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
                    "Welcome",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 30.0,
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
                                labelText: "Name",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Name cannot be Empty";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 20.9,
                          ),
                          TextFormField(
                              onChanged: (value) {
                                phone = int.parse(value);
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter Phone Number",
                                labelText: "Phone Number",
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
                            height: 20.9,
                          ),
                          TextFormField(
                              onChanged: (value) {
                                email = value;
                              },
                              decoration: InputDecoration(
                                hintText: "Enter Email",
                                labelText: "Email",
                              ),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Email cannot be Empty";
                                }
                                return null;
                              }),
                          SizedBox(
                            height: 20.9,
                          ),
                          // TextFormField(
                          //   obscureText: true,
                          //   decoration: InputDecoration(
                          //     hintText: "Enter Password",
                          //     labelText: "Password",
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
                          SizedBox(
                            height: 40.0,
                          ),
                          SingleChildScrollView(
                            child: SizedBox(
                              height: 100,
                              width: 360,
                              child: Card(
                                elevation: 2,
                                child: ListViewDemo(),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 40.0,
                          ),
                          InkWell(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  changeButton = true;
                                  map1 = Map.fromIterable(myList,
                                      key: (e) => e.Subject,
                                      value: (e) => e.Section);
                                  map1.remove("Select");
                                  print(map1.toString());
                                });
                                subjects.add(map1);
                                // await Future.delayed(Duration(seconds: 1));
                                // await Navigator.pushNamed(
                                //     context, MyRoutes.homeRoute);
                                http.Response response =
                                    await teacherregistration(
                                  name,
                                  email,
                                  phone,
                                  teacher['token'],
                                  subjects,
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
                                    desc: 'Teacher Registration Successful',
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
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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
