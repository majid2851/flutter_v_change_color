
import 'package:flutter/material.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';

class WishListScreen extends StatelessWidget
{
  static const String routeName='/wishlist';
  static Route route()
  {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:(_)=>WishListScreen()
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: CustomAppBar(title:'Wish List'),
        bottomNavigationBar: CustomNavBar()
    );
  }

}