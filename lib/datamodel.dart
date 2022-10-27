class Product {
  int id;
  String name;
  double price;
  String image;
  //compute property, that only has getter
  String get imageUrl =>
      "https://utsavsingh.me/roasted-beans-coffee-data/api/images/$image";

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}

class Category {
  //properties
  String name;
  List<Product> products;
  //constructer
  //named paramenters, named arguements
  Category({required this.name, required this.products});
}

class ItemInCart {
  Product product;
  int quantity;
  ItemInCart({required this.product, required this.quantity});
}
