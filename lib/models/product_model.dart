class Product {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discountPercentage;
  final double priceAfterDiscount;
  final String category;
  final double rating; // Ensure this is non-nullable
  final int reviewCount; // Ensure this is non-nullable

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discountPercentage,
    required this.priceAfterDiscount,
    required this.category,
    this.rating = 0.0, // Provide a default value for rating
    this.reviewCount = 0, // Provide a default value for reviewCount
  });

  // Factory method to calculate the price after discount
  factory Product.withDiscount({
    required int id,
    required String name,
    required String image,
    required double price,
    required double discountPercentage,
    required String category,
    double rating = 0.0, // Optional, default to 0.0
    int reviewCount = 0, // Optional, default to 0
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
      rating: rating,
      reviewCount: reviewCount,
    );
  }
}


List<Product> productData = [
  Product.withDiscount(
    id: 1,
    name: "Number One Classic",
    image: "assets/images/classic.png",
    price: 500.0,
    discountPercentage: 0,
    category: "Condom",
    rating: 4.5, // Rating for product
    reviewCount: 120, // Number of reviews
  ),
  Product.withDiscount(
    id: 2,
    name: "Number One Banana Love",
    image: "assets/images/banana.png",
    price: 1200.0,
    discountPercentage: 15.0,
    category: "Condom",
    rating: 4.7, // Rating for product
    reviewCount: 200, // Number of reviews
  ),
  Product.withDiscount(
    id: 3,
    name: "Ok Pill",
    image: "assets/images/ok.png",
    price: 150.0,
    discountPercentage: 20.0,
    category: "Contraceptive",
    rating: 4.2, // Rating for product
    reviewCount: 45, // Number of reviews
  ),
  Product.withDiscount(
    id: 4,
    name: "Lubricant Cucumber ",
    image: "assets/images/cucumber.png",
    price: 300.0,
    discountPercentage: 5.0,
    category: "Lubricant",
    rating: 4.6, // Rating for product
    reviewCount: 80, // Number of reviews
  ),
  Product.withDiscount(
    id: 5,
    name: "Orasel",
    image: "assets/images/orasel.png",
    price: 800.0,
    discountPercentage: 12.0,
    category: "Orasel",
    rating: 4.8, // Rating for product
    reviewCount: 100, // Number of reviews
  ),
  
];
