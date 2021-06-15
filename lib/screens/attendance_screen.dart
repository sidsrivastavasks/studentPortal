import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:csp/screens/attendance_mobile.dart';
import 'package:csp/screens/attendance_web.dart';

class AttendanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AttendanceMobile(),
      desktop: AttendanceWeb(),
    );
  }
}
