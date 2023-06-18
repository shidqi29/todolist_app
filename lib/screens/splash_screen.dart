import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:todolist_app/screens/home_page.dart';
import 'package:todolist_app/ui/themes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Size size = MediaQuery.of(context).size;
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    Future.delayed(
      Duration(seconds: 2),
      () {
        Get.to(HomePage());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/to-do-list.png',
              width: size.width * 0.3,
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "My Todo App",
              style: headingStyle,
            ),
          ],
        ),
      ),
    );
  }
}
