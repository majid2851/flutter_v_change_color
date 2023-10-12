
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widget/custom_appbar.dart';
import 'package:flutter_shop_app/widget/custom_navbar.dart';

class SplashScreen extends StatelessWidget
{
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName), builder: (_) => SplashScreen());
  }

  @override
  Widget build(BuildContext context)
  {
    Timer(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/');
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image(
            image: AssetImage('assets/image/logo.png'),
            fit: BoxFit.fill,
            width: 425,
            height: 520,
          ),)
        ],),

    );



  }

}
