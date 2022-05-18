import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_demo_01/app/app.router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import 'core/locator.dart';
import 'core/providers.dart';
import 'core/services/navigator_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'views/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocatorInjector.setupLocator();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  FirebaseFirestore.instance.settings = const Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);

  runApp(MainApplication());
}

class MainApplication extends StatefulWidget {
  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication> {
  @override
  void initState() {
    super.initState();
    //FirebaseUtility.initialiseFirebase();
    //AdsUtility.initialiseAds();
  }

  @override
  void dispose() {
    //AdsUtility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderInjector.providers,
      child: ScreenUtilInit(
          designSize: Size(414, 896),
          builder: (context, widget) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              // navigatorObservers: [locator<FirebaseAnalyticsService>().getObserver],
              navigatorKey: StackedService.navigatorKey,
              // theme: AppThemeData.appThemeData(),
              initialRoute: Routes.mainView,
              onGenerateRoute: StackedRouter().onGenerateRoute,
              builder: (context, widget) {
                // ScreenUtil.setContext(context);
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: widget,
                );
              },
            );
          }),
    );
  }
}
