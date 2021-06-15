import 'package:flutter/material.dart';

class AttendanceMobile extends StatefulWidget {
  @override
  _AttendanceMobileState createState() => _AttendanceMobileState();
}

class _AttendanceMobileState extends State<AttendanceMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(child: Text('Attendance')),
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 70,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20.0),
                height: 200,
                width: 200,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          // mainAxisAlignment:
                          //     MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Subject',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17.0,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Attendance',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                    // ListView(
                    //     // children: attendance(attend),
                    //     ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
