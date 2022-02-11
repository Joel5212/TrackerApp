import 'package:flutter/material.dart';
import './pages/login_page.dart';







class MyApp extends StatelessWidget {
final String? apiUrl;

MyApp(this.apiUrl);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Screen",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Georgia',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 8,
            foregroundColor: Colors.white,
          ),
          accentColor: Colors.blueGrey,
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 22.0, color: Colors.blueGrey),
              headline2: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.blueGrey,
              ),
              headline3: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
              headline4: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: Colors.black45
              ),
              bodyText1: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                color: Colors.blueGrey,
              ),),),

        home: LoginPage(apiUrl!)


    );
  }
}
