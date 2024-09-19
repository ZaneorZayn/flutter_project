import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_project/screens/productscreen/widgets/appbar.dart';
import 'package:new_project/widget/productcard.dart';
import '../../models/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int selectedCategoryIndex = 0;

  final List<String> categories = [
    'All Product',
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
    // Determine if the screen is a tablet or mobile
    bool isTablet = MediaQuery.of(context).size.width > 600;

    // Dynamic padding and margin values
    double horizontalPadding = isTablet ? 20.0 : 10.0;
    double verticalPadding = isTablet ? 16.0 : 8.0;
    double horizontalMargin = isTablet ? 12.0 : 5.0;

    return Scaffold(
      backgroundColor: const Color(0xffEDF8FD),
      appBar: CustomAppBarProduct(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel/Slider
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: verticalPadding, horizontal: horizontalPadding),
              child: ImageSlider1(),
            ),

            // Category Buttons
            Container(
              height: isTablet? 40:30,
              margin: EdgeInsets.symmetric(
                vertical: verticalPadding / 2,
                horizontal: horizontalPadding,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
              ),
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
                      margin: EdgeInsets.symmetric(horizontal: horizontalMargin / 2,vertical:isTablet ? 1 : 2.5),
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding / 2),
                      decoration: BoxDecoration(
                        color: isSelected ? const Color(0xff74D1F6) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        categories[index],
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: isSelected ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Filtered Products List
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 3 : 2, // 3 for tablet, 2 for mobile
                  mainAxisSpacing: verticalPadding,
                  crossAxisSpacing: horizontalPadding,
                  childAspectRatio: 3 / 4, // Adjust aspect ratio
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

class ImageSlider1 extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/banner1.png',
    'assets/images/banner2.png',
    'assets/images/banner3.png',
  ];

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to make height responsive
    bool isTablet = MediaQuery.of(context).size.width > 600;
    double sliderHeight = isTablet ? 300 : 225; // Responsive height

    return CarouselSlider(
      options: CarouselOptions(
        height: sliderHeight, // Adjust the height as needed
        autoPlay: true,
        enlargeCenterPage: false,
        autoPlayInterval: const Duration(seconds: 7),
        aspectRatio: 16 / 9,
        viewportFraction: 1,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
