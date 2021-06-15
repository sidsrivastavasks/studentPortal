import 'package:http/http.dart' as http;
import 'dart:convert';

const String url = 'https://24ccdc6c789e.ngrok.io';
Future<http.Response> adminlogin(String email, String password) {
  return http.post(
    '$url/admin/login',
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );
}

Future<http.Response> studentregistration(
  String name,
  int roll,
  String email,
  int phone,
  int sem,
  String stream,
  String sec,
  String token,
) {
  print(token);
  return http.post(
    '$url/admin/student',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
    body: jsonEncode(<dynamic, dynamic>{
      "name": name,
      "roll": roll,
      "email": email,
      "phone": phone,
      "sem": sem,
      "stream": stream,
      "section": sec,
    }),
  );
}

Future<http.Response> teacherregistration(
  String name,
  String email,
  int phone,
  String token,
  List subjects,
) {
  print(token);
  print(phone);
  print(phone.runtimeType);
  int ping = int.parse("2255");
  print(ping);
  return http.post(
    '$url/admin/teacher',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ' + token,
    },
    body: jsonEncode(<dynamic, dynamic>{
      "name": name,
      "email": email,
      "phone": phone,
      "subjects": subjects,
    }),
  );
}
