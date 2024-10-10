import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/models/product_model.dart';
// Ensure correct import of Product model

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.product.name,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
        toolbarHeight: 80,
        shadowColor: Colors.black,
        actions: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icon/Heart.svg',
                color: const Color(0xff64748B),
                width: 25,
                height: 25,
              ),
              onPressed: () {
                // Action for the heart button
              },
            ),
          ),
          const SizedBox(width: 6),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icon/cart.svg',
                color: const Color(0xff64748B),
                width: 30,
                height: 30,
              ),
              onPressed: () {
                // Action for the cart button
              },
            ),
          ),
          const SizedBox(width: 6),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey,
                width: 1.5,
              ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                'assets/icon/drawer.svg',
                color: const Color(0xff64748B),
                width: 40,
                height: 40,
              ),
              onPressed: () {
                // Action for the drawer button
              },
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Stack(
        children: [
          // Main content with scrolling
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 200), // Add padding to avoid overlapping with buttons
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image section with Favorite Button overlay
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 300,
                        child: ClipRRect(
                          child: Image.asset(
                            widget.product.image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 12,
                        right: 16,
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.5,
                            ),
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icon/Heart.svg',
                              color: const Color(0xff64748B),
                              width: 24,
                              height: 24,
                            ),
                            onPressed: () {
                              // Action for the favorite button
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 0),
                // Product Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    widget.product.name,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Product Price
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "\$${widget.product.priceAfterDiscount.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                // Rating and Quantity Selector
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20),
                          Text(
                            "${widget.product.rating} (${widget.product.reviewCount} reviews)",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: _decreaseQuantity,
                          ),
                          Text(
                            '$quantity',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          IconButton(
                            icon: SvgPicture.asset('assets/icon/Plus.svg'),
                            onPressed: _increaseQuantity,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Product Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "This is a detailed description of the product. It provides all the information a customer might need to make an informed purchasing decision.",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Bottom-aligned Add to Cart section using Align
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Buy Now Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle Buy Now logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff002A4C),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icon/cart.svg",
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Buy Now | \$${widget.product.price}",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  // Add to Cart Button
                  ElevatedButton(
                    onPressed: () {
                      // Handle Add to Cart logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff2DB1E5),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icon/cart.svg",
                          color: Colors.white,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Add to Cart",
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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
