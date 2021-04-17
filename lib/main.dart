import 'package:provider/provider.dart';
import './screens/drawpage.dart';
import './screens/editDetails.dart';
import './screens/emergencycontacts.dart';
import './screens/registerpage.dart';
import './screens/splash_screen.dart';
import './screens/startup_screen.dart';
import './widgets/loginpage.dart';
import './rest/login.dart';
import './screens/auth_screen.dart';
import './screens/location.dart';
import 'package:flutter/material.dart';

import './screens/nature_screen.dart';
import './screens/accident_screen.dart';
import './screens/fire_screen.dart';
import './screens/theft_screen.dart';
import './screens/women_harass_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Login(),
        ),
      ],
      child: Consumer<Login>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: auth.isauth
              ? HomePage()
              : FutureBuilder(
                  future: auth.checkuser(),
                  builder: (ctx, autosnap) =>
                      autosnap.connectionState == ConnectionState.waiting
                          ? SplashScreen()
                          : StartUpScreen(),
                ),
          routes: {
            HomePage.routeName: (ctx) => HomePage(),
            GetLocationPage.routeName: (ctx) => GetLocationPage(),
            RegisterPage.routeName: (ctx) => RegisterPage(),
            StartUpScreen.routename: (ctx) => StartUpScreen(),
            // DrawPage.routename: (ctx) => DrawPage(),
            EditDetails.routename: (ctx) => EditDetails(),
            EmergencyContacts.routename: (ctx) => EmergencyContacts(),
            NaturalCalamityScreen.routeName: (ctx) => NaturalCalamityScreen(),
            WomenHarassScreen.routeName: (ctx) => WomenHarassScreen(),
            TheftScreen.routeName: (ctx) => TheftScreen(),
            AccidentScreen.routeName: (ctx) => AccidentScreen(),
            FireScreen.routeName: (ctx) => FireScreen(),
          },
        ),
      ),
    );
  }
}
