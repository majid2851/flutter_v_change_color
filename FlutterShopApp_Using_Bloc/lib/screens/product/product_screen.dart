
import 'package:flutter/material.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';

class ProductScreen extends StatelessWidget
{
  static const String routeName='/product';
  static Route route()
  {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:(_)=>ProductScreen()
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: CustomAppBar(title:'Product'),
        bottomNavigationBar: CustomNavBar()
    );
  }

}