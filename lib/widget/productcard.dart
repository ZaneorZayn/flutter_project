import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/screens/productscreen/product_detail.dart';
import '../models/product_model.dart';

class Productcard extends StatelessWidget {
  final Product product;

  const Productcard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: product)));
      },
      child: Card(
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
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold
                          )
                        ),
                        const SizedBox(height: 4),
      
                        
                        // If there's a discount, show price after discount and original price in a row
                        if (product.discountPercentage > 0)
                          Row(
                            children: [
                              Text(
                                "\$${product.priceAfterDiscount.toStringAsFixed(2)}", // Price after discount
                                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              
                            )
                              ),
                              const SizedBox(width: 8), // Spacing between prices
                              Text(
                                "\$${product.price.toStringAsFixed(2)}", // Original price
                               style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.red,
                              decoration: TextDecoration.lineThrough
                              
                            )
                              ),
                            ],
                          )
                        else
                          // No discount, show only the regular price
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.bold
                            )
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
      
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
            const SizedBox(height: 4),
      
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
                  color: Color(0xff74D1F6), // Background color for button
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle Add to Cart action
                      },
                      child:  Text(
                        'Add to Cart',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        height: 40, // Smaller size for the icon background
                        width: 40, // Make it circular
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 1.5, // Border width
                          ),
                        ),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/icon/Heart.svg',
                            color: const Color(0xff64748B),
                            width: 24, // Icon size
                            height: 24, // Icon size
                          ),
                          onPressed: () {
                            
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
