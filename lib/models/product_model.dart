class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discountPercentage;
  final double priceAfterDiscount;
  final String category;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discountPercentage,
    required this.priceAfterDiscount,
    required this.category,
  });

  // Method to calculate the price after discount
  factory Product.withDiscount({
    required int id,
    required String name,
    required String image,
    required double price,
    required double discountPercentage,
    required String category,
  }) {
    double priceAfterDiscount = price - (price * (discountPercentage / 100));
    return Product(
      id: id,
      name: name,
      image: image,
      price: price,
      discountPercentage: discountPercentage,
      priceAfterDiscount: priceAfterDiscount,
      category: category,
    );
  }
}

List<Product> productData = [
  Product.withDiscount(
    id: 1,
    name: "Smartphone",
    image: "assets/images/classic.png",
    price: 500.0,
    discountPercentage: 0,
    category: "Condom",
  ),
  Product.withDiscount(
    id: 2,
    name: "Laptop",
    image: "assets/images/banana.png",
    price: 1200.0,
    discountPercentage: 15.0,
    category: "Condom",
  ),
  Product.withDiscount(
    id: 3,
    name: "Headphones",
    image: "assets/images/ok.png",
    price: 150.0,
    discountPercentage: 20.0,
    category: "Contraceptive",
  ),
  Product.withDiscount(
    id: 4,
    name: "Smartwatch",
    image: "assets/images/cucumber.png",
    price: 300.0,
    discountPercentage: 5.0,
    category: "Lubricant",
  ),
  Product.withDiscount(
    id: 5,
    name: "Camera",
    image: "assets/images/orasel.png",
    price: 800.0,
    discountPercentage: 12.0,
    category: "Orasel",
  ),
  Product.withDiscount(
    id: 6,
    name: "Bluetooth Speaker",
    image: "assets/images/strawberry.png",
    price: 100.0,
    discountPercentage: 25.0,
    category: "Condom",
  ),
];
