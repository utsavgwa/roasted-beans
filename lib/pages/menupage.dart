import 'package:flutter/material.dart';
import 'package:roasted_beans/datamanager.dart';

import '../datamodel.dart';

// menupage is rendering a future builder, it means it is rendering some content,
// based on requesting that content from a Future.
// content for a while loads up, for that we have CircularProgressIndicator(),
// there can be error, so it will render error

class MenuPage extends StatelessWidget {
  //recieving the same property data manager
  final DataManager dataManager;
  //taking data manager arguement
  const MenuPage({Key? key, required this.dataManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var p = Product(id: 1, name: "Dummy", price: 2.3, image:"");
    return FutureBuilder(
        future: dataManager.getMenu(), //this is the future
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            //the Future has finished, data is ready
            var categories = snapshot.data!;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(categories[index].name),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: categories[index].products.length,
                      itemBuilder: (context, prodIndex) {
                        var product = categories[index].products[prodIndex];
                        return ProductItem(
                            product: product,
                            onAdd: () {
                              dataManager.cartAdd(product);
                            });
                      },
                    )
                  ],
                );
              },
            );
          } else {
            //HERE WE are rendering an error
            if (snapshot.hasError) {
              //data is not there because of an error
              return const Text("Error Occurred");
            } else {
              //means data is in progress, Future didn't finish yet
              return const CircularProgressIndicator();
            }
          }
        });
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
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.network(product.imageUrl),
            ),
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
