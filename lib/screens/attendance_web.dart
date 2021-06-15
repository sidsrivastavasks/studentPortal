import 'package:flutter/material.dart';

class AttendanceWeb extends StatefulWidget {
  @override
  _AttendanceWebState createState() => _AttendanceWebState();
}

class _AttendanceWebState extends State<AttendanceWeb> {
  // final List attend;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(horizontal: 130, vertical: 30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(17),
            ),
            child: Container(
              width: double.infinity,
              height: 650.0,
              child: Padding(
                padding: EdgeInsets.all(35.0),
                child: Row(
                  children: [
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// List<Widget> attendance(List attend) {
//   List<Widget> alist = [];
//   for (var i = 0; i < attend.length; i++) {
//     alist.add(
//       Attendance(),
//     );
//   }
//   return alist;
// }
