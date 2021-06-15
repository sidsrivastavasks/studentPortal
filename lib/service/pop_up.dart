import 'package:csp/service/custom_rect_tween.dart';
import 'package:flutter/material.dart';
import 'package:csp/service/constant.dart';

const String _heroAddTodo = 'add-todo-hero';

class AddTodoPopupCard extends StatelessWidget {
  AddTodoPopupCard({
    this.onChangedEmail,
    this.onChangedPassword,
    @required this.onTap,
    @required this.portalname,
  });
  final Function onTap;
  final String portalname;
  final Function onChangedEmail;
  final Function onChangedPassword;
  @override
  Widget build(BuildContext context) {
    return Center(
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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Text(
                        portalname,
                        style: loginHeadingBarStyle,
                      ),
                    ),
                    TextField(
                      onChanged: onChangedEmail,
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
                      onChanged: onChangedPassword,
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
                      onPressed: onTap,
                      child: Container(
                        height: 35,
                        width: 50,
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
    );
  }
}
