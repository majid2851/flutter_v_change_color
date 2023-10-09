import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_shop_app/models/models.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';
import '../../widget/product_card.dart';

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
        bottomNavigationBar: CustomNavBar(),
        body:

        BlocBuilder<WishlistBloc,WishlistState>(
          builder: (context,state)
          {
            if(state is WishlistLoading)
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is WishlistLoaded)
            {
              print("wishSize:"+state.wishlist.products.length.toString());

              return GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 4.0,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // Adjust as needed
                  childAspectRatio: 2.4,// Adjust as needed
                ),
                itemCount: state.wishlist.products.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: ProductCard(
                      productModel: state.wishlist.products[index],
                      widthFactor: 1.1,
                      isWishList: true,
                    ),
                  );
                },
              );

            }  else return Text('Something Went Wrong');

          }

        ),
    );
  }

}