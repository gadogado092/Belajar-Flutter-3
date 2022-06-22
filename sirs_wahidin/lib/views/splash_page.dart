import 'package:flutter/material.dart';
import 'package:sirs_wahidin/utils/my_sharedpreferences.dart';
import 'package:sirs_wahidin/views/login_page.dart';
import 'package:sirs_wahidin/views/member_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Future<void> _checkLogin() async {
    await Future.delayed(Duration(seconds: 3));
    var res = await checkLogin();

    if (res) {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => MemberPage(),
        ),
        (route) => false,
      );
    } else {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => LoginPage(),
        ),
        (route) => false, //if you want to disable back feature set to false
      );
    }
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Selamat Datang"),
      ),
    );
  }
}
