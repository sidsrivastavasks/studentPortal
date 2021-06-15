import 'package:csp/service/constant.dart';
import 'package:flutter/material.dart';

class LoginBox extends StatelessWidget {
  LoginBox({@required this.loginName, @required this.onTap});
  final String loginName;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
      child: FlatButton(
        child: Container(
          height: 100,
          width: 250,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                hexToColor("#861c03"),
                hexToColor("#852b17"),
                hexToColor("#b9533c"),
              ],
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Text(
              loginName,
              style: loginTextStyle,
            ),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
