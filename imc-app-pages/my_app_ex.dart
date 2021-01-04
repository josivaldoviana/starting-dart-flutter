import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/imc_page.dart';
import 'package:flutter_app/login_page.dart';

import 'app_controller.dart';
import 'app_controller_ex.dart';
import 'home.dart';
import 'home_ex.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: AppController.instance,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.red,
              brightness: AppController.instance.isDartTheme ? Brightness.dark : Brightness.light,
            ),
            home: ImcPage(),
          );
        });
  }
}
