import 'package:flutter/material.dart';

import '../datamodel.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    var p = Product(id: 1, name: "Dummy", price: 2.3, image: "");
    return ListView(
      children: [
        ProductItem(
          product: p,
          onAdd: () {},
        ),
        ProductItem(
          product: p,
          onAdd: () {},
        ),
        ProductItem(
          product: p,
          onAdd: () {},
        ),
      ],
    );
  }
}

//this widget a renders one product on the screen,
class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;

  // recieveing in constructor
  const ProductItem({Key? key, required this.product, required this.onAdd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: Card(
        elevation: 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/black_coffee.png"),
            //overall positioning
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //for name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("\$ ${product.price}"),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    child: const Text("Add"),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
