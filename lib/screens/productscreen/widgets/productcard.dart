import 'package:flutter/material.dart';
import '../../../models/product_model.dart';

class Productcard extends StatelessWidget {
  final Product product;

  const Productcard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with discount badge
              Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    product.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Product details section
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Product name
                      Text(
                        product.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),

                      // If there's a discount, show price after discount and strike-through original price
                      if (product.discountPercentage > 0)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "\$${product.priceAfterDiscount.toStringAsFixed(2)}", // Price after discount
                              style: const TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "\$${product.price.toStringAsFixed(2)}", // Original price
                              style: const TextStyle(
                                color: Colors.redAccent,
                                decoration: TextDecoration.lineThrough, // Cross out the old price
                                fontSize: 12,
                              ),
                            ),
                          ],
                        )
                      else
                      // No discount, show only the regular price
                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 4,),

          // Discount badge using Stack, shown only if there is a discount
          if (product.discountPercentage > 0)
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "-${product.discountPercentage}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
       SizedBox(height: 4,),
          // Add to Cart Button using Align
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity, // Button takes full width
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.blueAccent, // Background color for button
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle Add to Cart action
                    },
                    child: const Text(
                      'Add to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 16.0),
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
