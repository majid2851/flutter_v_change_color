
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/blocs/cart/cart_bloc.dart';
import 'package:flutter_shop_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:flutter_shop_app/models/models.dart';
import 'package:flutter_shop_app/widget/hero_carousel_card.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';

class ProductScreen extends StatelessWidget
{
  static const String routeName='/product';
  static Route route({required ProductModel productModel})
  {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:(_)=>ProductScreen(productModel:productModel)
    );
  }
  final ProductModel productModel;
  const ProductScreen({required this.productModel});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: CustomAppBar(title:productModel.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,)),
                BlocBuilder<WishlistBloc,WishlistState>(
                  builder: (context,state) {
                    return IconButton(onPressed: (){
                      context.read<WishlistBloc>()
                             .add(AddWishlistProduct(productModel));
                      final snackBar=SnackBar(content: Text('Added to your Wishlist'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                        icon: Icon(Icons.favorite,color: Colors.white,)
                    );
                  }),
                BlocBuilder<CartBloc,CartState>(
                  builder: (context,state) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed:(){
                        context.read<CartBloc>().add(CartProductAdded(productModel));
                        Navigator.pushNamed(context, '/cart');
                      },
                      child:Text(
                        'ADD TO CART',
                        style: Theme.of(context).
                        textTheme.headline3,
                      ));
                  }
                )
              ],
            ),
          ),
        ),
        body: ListView(
          children:[ CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
            ),
            items: [HeroCarouselCard(productModel: productModel,)]
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.bottomCenter,
                  color: Colors.black.withAlpha(50),
                ),
                Container(
                  margin:const EdgeInsets.all(5.0),
                  width: MediaQuery.of(context).size.width-10,
                  height: 50,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(productModel.name,style: Theme.of(context)
                            .textTheme.headline5?.copyWith(color:Colors.white),),

                        Text('${productModel.price.toString()}',style: Theme.of(context)
                            .textTheme.headline5?.copyWith(color:Colors.white),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title:Text(
                  'Product Information',
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(title:Text(
                      'Wake up to reallity nothing ever '
                          'goes as planned in this accuresed world,the longer you live'
                          'the more you realize that the only thing that truely'
                          'exists in this reallity are merely pain suffering and futility'
                  ),

                  )
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ExpansionTile(
                initiallyExpanded: true,
                title:Text(
                  'Delivery Information',
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(title:Text(
                      'She Decided to die,at the hands of someone she loved,to protect hidden leaf'
                    ),

                  )
                ],
            ),
          ),
        ]
      ),
    );
  }

}