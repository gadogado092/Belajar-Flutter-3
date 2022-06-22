import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sirs_wahidin/models/user.dart';
import 'package:sirs_wahidin/utils/my_sharedpreferences.dart';

import 'member_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _controllerEmail;
  late TextEditingController _controllerPassword;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  Future<void> login() async {
    Map<String, String> data = {
      "email": _controllerEmail.text,
      "password": _controllerPassword.text
    };

    final response = await http
        .post(Uri.parse('http://172.16.25.186/api/login'), body: data);

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);
      final user = User.fromJson(res["data"]);
      if (user.token != "") {
        await savePreference(user);
        Navigator.pushAndRemoveUntil<dynamic>(
          context,
          MaterialPageRoute<dynamic>(
            builder: (BuildContext context) => MemberPage(),
          ),
          (route) => false,
        );
      } else {
        print("failed Login");
        // Get.snackbar("Hi", "I'm modern snackbar");
      }
    } else {
      print("failed Login");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Silahkan Login",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              controller: _controllerPassword,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                // Get.snackbar("Hi", "I'm modern snackbar");
                login();
              },
              child: Text("Login"))
        ],
      ),
    );
  }
}
