import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/category_model.dart';
import '../../models/product_model.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';
import '../../widget/product_card.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';

  static Route route({required CategoryModel categoryModel}) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(categoryModel: categoryModel),
    );
  }

  final CategoryModel categoryModel;
  const CatalogScreen({required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> categoryProducts = ProductModel.products
        .where((product) => product.category == categoryModel.name)
        .toList();

    return Scaffold(
      appBar: CustomAppBar(title: categoryModel.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 4.0,
        ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // Adjust as needed
          childAspectRatio: 1, // Adjust as needed
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              productModel: categoryProducts[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}
