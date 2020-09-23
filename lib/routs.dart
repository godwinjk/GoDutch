import 'package:flutter/widgets.dart';
import 'package:group_share/screen/splash_screen.dart';
import 'package:group_share/screen/home.dart';


// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  Home.routeName: (context) => Home(0),
};
