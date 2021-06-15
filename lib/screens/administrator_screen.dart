import 'package:flutter/material.dart';
import 'package:csp/service/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:csp/service/login_box.dart';
import '../utils/routes.dart';
import 'package:csp/screens/student_registration.dart';

class AdminScreen extends StatefulWidget {
  AdminScreen({@required this.token});
  final String token;
  @override
  _AdminScreenState createState() => _AdminScreenState(token: token);
}

class _AdminScreenState extends State<AdminScreen> {
  _AdminScreenState({@required this.token});
  final String token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: hexToColor("#861c03"),
        title: Text(
          'Arkadev Banerjee',
          style: bArheadingstyle,
        ),
        actions: [
          IconButton(
            tooltip: 'Admin Register',
            icon: Icon(Icons.add_rounded),
            onPressed: () {},
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            tooltip: 'Logout',
            padding: EdgeInsets.only(right: 20.0),
            icon: Icon(FontAwesomeIcons.powerOff),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
        leading: Icon(FontAwesomeIcons.userCircle),
      ),
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                LoginBox(
                  loginName: 'Student Register',
                  onTap: () {
                    print(token);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => StudentRegistration(token: token),
                    //   ),
                    // );
                    Navigator.pushNamed(
                      context,
                      MyRoutes.studentregistration,
                      arguments: {
                        'token': token,
                      },
                    );
                  },
                ),
                LoginBox(
                  loginName: 'Teacher Register',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      MyRoutes.loginRoute,
                      arguments: {
                        'token': token,
                      },
                    );
                  },
                ),
                LoginBox(
                  loginName: 'Subject Register',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
