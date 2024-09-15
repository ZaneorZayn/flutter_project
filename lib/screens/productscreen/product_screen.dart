import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/productscreen/widgets/appbar.dart';
import 'package:new_project/screens/productscreen/widgets/productcard.dart';
import '../../models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedCategoryIndex = 0;
  final List<String> categories = [
    'All',
    'Condom',
    'Contraceptive',
    'Lubricant',
    'Orasel'
  ];

  // Filter products based on selected category
  List<Product> getFilteredProducts() {
    if (selectedCategoryIndex == 0) {
      return productData; // Show all products when 'All' is selected
    } else {
      String selectedCategory = categories[selectedCategoryIndex];
      return productData
          .where((product) => product.category == selectedCategory)
          .toList();
    }
  }

  // Function to update the selected category
  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarProduct(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel/Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                aspectRatio: 2.0,
                initialPage: 0,
              ),
              items: productData
                  .map((product) => Container(
                margin: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(product.image,
                      fit: BoxFit.cover, width: 1000),
                ),
              ))
                  .toList(),
            ),

            // Category Buttons
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  bool isSelected = index == selectedCategoryIndex;
                  return GestureDetector(
                    onTap: () {
                      _onCategorySelected(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.pinkAccent : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? Colors.pinkAccent : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Filtered Products List - Needs to be wrapped in a ConstrainedBox to avoid conflicting scrolling behavior
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height, // Restrict the height of the GridView
              ),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(), // Disable inner scrolling of the grid
                shrinkWrap: true, // Allows GridView to take only necessary space
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Display 2 products per row
                  mainAxisSpacing: 6,
                  crossAxisSpacing: 6,
                  childAspectRatio: 3 / 4, // Adjust aspect ratio of product cards
                ),
                itemCount: getFilteredProducts().length,
                itemBuilder: (context, index) {
                  var product = getFilteredProducts()[index];
                  return Productcard(product: product);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
