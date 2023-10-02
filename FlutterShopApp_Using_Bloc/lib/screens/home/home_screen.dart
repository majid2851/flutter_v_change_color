
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/category_model.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';
import '../../widget/hero_carousel_card.dart';

class HomeScreen extends StatelessWidget
{
  static const String routeName='/';
  static Route route()
  {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder:(_)=>HomeScreen()
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: CustomAppBar(title:'Flutter Shopp App'),
        bottomNavigationBar: CustomNavBar(),
        body: Container(
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: CategoryModel.categories.map((categoryModel)
              =>HeroCarouselCard(categoryModel: categoryModel)).toList(),
          ),
        ),
    );
  }
}
