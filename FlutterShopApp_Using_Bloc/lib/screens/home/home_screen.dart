
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/category_model.dart';
import 'package:flutter_shop_app/models/models.dart';
import 'package:flutter_shop_app/widget/product_carousel.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';
import '../../widget/hero_carousel_card.dart';
import '../../widget/product_card.dart';
import '../../widget/section_title.dart';

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
        body: Column(
          children: [
            Container(
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
            SectionTitle(title:'RECOMMENDED'),
            ProductCarousel(
              products:ProductModel.products
                  .where((productModel) => productModel.isRecommended).toList()
            ),
            SectionTitle(title:'Popular'),
            // ProductCard(product:ProductModel.products[0])
            ProductCarousel(
                products:ProductModel.products
                    .where((productModel) => productModel.isPopular).toList()
            )

          ],
        ),
    );
  }
}


