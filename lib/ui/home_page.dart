import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist_app/services/notification_services.dart';
import 'package:todolist_app/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    // notifyHelper.requestIOSPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Text('data'),
    );
  }

  _appBar() {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode
                  ? "Activated Light Mode"
                  : "Activated Dark Mode");
          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Icons.nightlight_round_outlined,
          size: 24,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 24,
        ),
        SizedBox(
          width: 20,
        )
      ],
    );
  }
}
