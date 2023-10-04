import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/category_model.dart';
import 'package:flutter_shop_app/models/models.dart';
import 'package:flutter_shop_app/screens/cart/cart_screen.dart';
import 'package:flutter_shop_app/screens/catalog/catalog_screen.dart';
import 'package:flutter_shop_app/screens/home/home_screen.dart';
import 'package:flutter_shop_app/screens/product/product_screen.dart';
import 'package:flutter_shop_app/screens/screens.dart';

class AppRouter
{
  static Route onGenerateRoute(RouteSettings settings)
  {
    print('This is route:${settings.name}');

    switch(settings.name)
    {
      case '/':
        return HomeScreen.route();

      case HomeScreen.routeName:
        return HomeScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(
            categoryModel:settings.arguments as CategoryModel
        );
      case ProductScreen.routeName:
        return ProductScreen.
          route(productModel: settings.arguments as ProductModel);
      case WishListScreen.routeName:
        return WishListScreen.route();

      default:
        return _errorRoute();

    }
  }

  static Route _errorRoute()
  {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder:(_)=>Scaffold(appBar: AppBar(title:Text('Error')),)
    );
  }


}
