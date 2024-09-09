import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ResponsiveCarousel extends StatelessWidget {
  final List<String> imageUrls = [
    'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGwVd07rcBUxKVqf17F_Li5fy-a_zni7JuEQ&s',
    'https://via.placeholder.com/800x400.png?text=Slide+3',
  ];

  @override
  Widget build(BuildContext context) {
    // Determine screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine if the device is a tablet
    bool isTablet = screenWidth > 600;

    // Adjust height based on device type
    double carouselHeight = isTablet ? 200 : 100; // Increase height for tablets

    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      options: CarouselOptions(
        height: carouselHeight,
        aspectRatio: isTablet ? 4 / 3 : 16 / 9, // Adjust aspect ratio for tablets
        viewportFraction: 1,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 1200),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imageUrls[index],
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      },
    );
  }
}

