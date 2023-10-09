
import 'package:flutter/material.dart';
import 'package:flutter_shop_app/models/models.dart';
import '../../widget/cart_product_card.dart';
import '../../widget/custom_appbar.dart';
import '../../widget/custom_navbar.dart';

class CartScreen extends StatelessWidget
{
  static const String routeName='/cart';
  static Route route()
  {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder:(_)=>CartScreen()
    );
  }


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: CustomAppBar(title:'Cart'),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.white),
                    onPressed: (){},
                    child: Text(
                      'GO TO CHECKBOX',
                      style: Theme.of(context).textTheme.headline3,
                    )
                )
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal:8.0,vertical:8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Add \$20.0 for FREE Delivery',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      ElevatedButton(
                          onPressed:(){
                            Navigator.pushNamed(context, '/');
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(),
                            elevation: 0
                          ),
                          child: Text(
                            'Add More Items',
                            style: Theme.of(context).textTheme.headline6
                                ?.copyWith(color: Colors.white),
                          )
                      )
                    ],
                  ),
                  SizedBox(height: 10,),
                  CartProductCard(productModel: ProductModel.products[0],),
                  CartProductCard(productModel: ProductModel.products[2],),
                ],
              ),

              Column(
                children: [
                  Divider(thickness: 2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('SUBTOTAL',style: Theme.of(context).textTheme.headline5,),
                            Text('\$5.98',style: Theme.of(context).textTheme.headline5,)
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Delivery Fee',style: Theme.of(context).textTheme.headline5,),
                            Text('\$2.65',style: Theme.of(context).textTheme.headline5,)
                          ],
                        ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.all(5.0),
                        height: 50,
                        decoration: BoxDecoration(color: Colors.black),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total',
                                style: Theme.of(context).
                                textTheme.headline5?.copyWith(color: Colors.white),),
                              Text('\$22.65',style: Theme.of(context).textTheme.headline5
                                  ?.copyWith(color: Colors.white) ,)
                            ],
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              )
          ],),
        ),



    );
  }

}

