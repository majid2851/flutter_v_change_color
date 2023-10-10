
import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartProductCard extends StatelessWidget
{
  final ProductModel productModel;
  const CartProductCard({Key? key,required this.productModel}):super(key: key);



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
          Row(children: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.remove_circle)
            ),
            Text('1',style: Theme.of(context).textTheme.headline5,),
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add_circle)
            ),
          ],)

        ],

      ),
    );
  }

}