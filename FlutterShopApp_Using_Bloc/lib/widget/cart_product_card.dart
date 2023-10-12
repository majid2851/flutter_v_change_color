
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shop_app/blocs/cart/cart_bloc.dart';

import '../models/product_model.dart';

class CartProductCard extends StatelessWidget
{
  final ProductModel productModel;
  final int quantity;

  const CartProductCard({Key? key,required this.productModel,required this.quantity}):super(key: key);



  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.network(
            productModel.imageUrl,
            width: 100,
            height:80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productModel.name),
                Text(
                  '\$' + productModel.price.toString(),
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
          ),
          SizedBox(width: 10,),
          BlocBuilder<CartBloc,CartState>(
            builder: (context,state) {
              return Row(children: [
                IconButton(
                    onPressed: (){
                      context.read<CartBloc>().add(CartProductRemoved(productModel));
                    },
                    icon: Icon(Icons.remove_circle)
                ),
                Text('$quantity',style: Theme.of(context).textTheme.headline4,),
                IconButton(
                    onPressed: (){
                      context.read<CartBloc>().add(CartProductAdded(productModel));
                    },
                    icon: Icon(Icons.add_circle)
                ),
              ],);
            }
          )

        ],

      ),
    );
  }

}