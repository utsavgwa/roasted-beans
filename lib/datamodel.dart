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

  //factory constructor
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'] as int,
        name: json['name'] as String,
        price: json['price'] as double,
        image: json['image'] as String);
  }
}

class Category {
  //properties
  String name;
  List<Product> products;
  //constructer
  //named paramenters, named arguements
  Category({required this.name, required this.products});

  factory Category.fromJson(Map<String, dynamic> json) {
    //its taking in the id and the products and creating the structure
    var productsJson = json['products'] as Iterable<dynamic>;
    var products = productsJson.map((p) => Product.fromJson(p)).toList();
    return Category(name: json['name'] as String, products: products);
  }
}

class ItemInCart {
  Product product;
  int quantity;
  ItemInCart({required this.product, required this.quantity});
}
