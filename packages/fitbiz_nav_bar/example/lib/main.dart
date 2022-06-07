import 'package:fitbiz_nav_bar/fitbiz_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _index = 0;
  FitbizNavBarController controller = FitbizNavBarController();

  @override
  Widget build(BuildContext context) {
    final double tabIconSize = 28;

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        title: 'Floating NavBar Example',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Fitbiz NavBar Example'),
            centerTitle: true,
          ),
          //If you want to show body behind the navbar, it should be true
          extendBody: true,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: Colors.amber,
                  height: 400,
                  width: 500,
                  child: TextButton(
                    onPressed: () {
                      controller.hideNavBar!();
                    },
                    child: Text(
                      "index: $_index",
                      style: const TextStyle(
                        fontSize: 52,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blueAccent,
                  height: 400,
                  width: 500,
                  child: TextButton(
                    onPressed: () {
                      controller.showNavBar!();
                    },
                    child: Text(
                      "index: $_index",
                      style: const TextStyle(
                        fontSize: 52,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.redAccent,
                  height: 400,
                  width: 500,
                  child: Text(
                    "index: $_index",
                    style: const TextStyle(
                      fontSize: 52,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: FitbizNavbar(
            onTap: (int val) => setState(() => _index = val),
            currentIndex: _index,
            safeAreaHeight: 40,
            height: 119.h,
            controller: controller,
            items: [
              FitbizNavbarItem(icon: Icons.home, title: 'Home'),
              FitbizNavbarItem(icon: Icons.explore, title: 'Explore'),
              FitbizNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
              FitbizNavbarItem(
                customWidgetInactive: Container(
                  constraints: BoxConstraints(maxHeight: tabIconSize, minHeight: tabIconSize, minWidth: tabIconSize, maxWidth: tabIconSize),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Icon(
                    Icons.settings,
                    color: Color(0xff9E9EA5),
                  ),
                ),
                customWidgetActive: Container(
                  constraints: BoxConstraints(maxHeight: tabIconSize, minHeight: tabIconSize, minWidth: tabIconSize, maxWidth: tabIconSize),
                  margin: const EdgeInsets.only(bottom: 5),
                  child: const Icon(
                    Icons.settings,
                    color: Color(0xff007BFF),
                  ),
                ),
                title: 'Settings',
              )
            ],
          ),
        ),
      ),
    );
  }
}
