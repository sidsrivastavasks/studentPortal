import 'package:flutter/material.dart';
import 'package:csp/service/constant.dart';
import 'package:csp/service/login_box.dart';
import 'package:csp/service/hero_dialog_route.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:csp/service/user_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:csp/screens/administrator_screen.dart';
import 'package:csp/service/custom_rect_tween.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: hexToColor("#861c03"),
          title: Center(
            child: Text(
              'Bengal Institute of Technology',
              style: bArheadingstyle,
            ),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: showspinner,
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    LoginBox(
                      loginName: 'Student Login',
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(HeroDialogRoute(builder: (context) {
                        //   return AddTodoPopupCard();
                        // }));
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    LoginBox(
                      loginName: 'Teachers Login',
                      onTap: () {
                        // Navigator.of(context)
                        //     .push(HeroDialogRoute(builder: (context) {
                        //   return AddTodoPopupCard();
                        // }));
                      },
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    LoginBox(
                      loginName: 'Administrator Login',
                      onTap: () {
                        Navigator.of(context)
                            .push(HeroDialogRoute(builder: (context) {
                          return AddTodoPopupCard();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const String _heroAddTodo = 'add-todo-hero';

class AddTodoPopupCard extends StatefulWidget {
  @override
  _AddTodoPopupCardState createState() => _AddTodoPopupCardState();
}

class _AddTodoPopupCardState extends State<AddTodoPopupCard> {
  String ademail;
  String adpassword;
  bool showspinner = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showspinner,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Hero(
            tag: _heroAddTodo,
            createRectTween: (begin, end) {
              return CustomRectTween(begin: begin, end: end);
            },
            child: Material(
              color: hexToColor("#ffffff"),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          'Administrator Login Portal',
                          style: loginHeadingBarStyle,
                        ),
                      ),
                      TextField(
                        onChanged: (value) {
                          ademail = value;
                        },
                        style: TextStyle(color: Colors.grey.shade600),
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.grey.shade800,
                      ),
                      Divider(
                        color: Colors.grey.shade600,
                        thickness: 0.3,
                      ),
                      TextField(
                        obscureText: true,
                        onChanged: (value) {
                          adpassword = value;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: InputBorder.none,
                        ),
                        cursorColor: Colors.grey.shade800,
                      ),
                      Divider(
                        color: Colors.grey.shade600,
                        thickness: 0.3,
                      ),
                      FlatButton(
                        onPressed: () async {
                          print("Hello World");
                          setState(() {
                            showspinner = true;
                          });
                          if (ademail == null || adpassword == null) {
                            setState(() {
                              showspinner = false;
                            });
                            Alert(
                              context: context,
                              title: 'Please Fill the Login Form!',
                              desc: 'Invalid Username & Password',
                            ).show();
                          } else {
                            http.Response response =
                                await adminlogin(ademail, adpassword);
                            print(response.statusCode);
                            String data = response.body;
                            dynamic decodedData = jsonDecode(data);
                            if (response.statusCode == 200) {
                              setState(() {
                                showspinner = false;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      AdminScreen(
                                    token: decodedData['token'],
                                  ),
                                ),
                              );
                            } else {
                              Alert(
                                context: context,
                                title: 'Error ${response.statusCode}!',
                                desc: decodedData['message'],
                              ).show();
                            }
                            setState(() {
                              showspinner = false;
                            });
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                hexToColor("#861c03"),
                                hexToColor("#852b17"),
                                hexToColor("#b9533c"),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(7.0),
                          ),
                          child: Center(
                            child: Text(
                              'Login',
                              style: loginButtonstyle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
