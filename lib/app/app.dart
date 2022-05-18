import 'package:flutter_firebase_demo_01/views/main/main_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(
    page: MainView,
  ),
])
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it */
}
