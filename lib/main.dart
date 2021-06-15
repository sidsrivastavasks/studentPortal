import 'package:csp/screens/teacher_registration.dart';
import 'package:csp/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:csp/screens/home_screen.dart';
import 'package:csp/screens/student_registration.dart';

void main() => runApp(CSP());

class CSP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset('images/logo.png'),
        nextScreen: HomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
      routes: {
        'login': (context) => HomeScreen(),
        MyRoutes.loginRoute: (context) => LogIn(),
        MyRoutes.studentregistration: (context) => StudentRegistration(),
      },
    );
  }
}
