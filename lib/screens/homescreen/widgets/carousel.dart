import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ResponsiveCarousel extends StatelessWidget {
  final List<String> imageList = [
    "assets/images/Slide1.png",
    "assets/images/Slide2.png",
    "assets/images/Slide3.png",
  ];

  ResponsiveCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine if the device is a tablet
    bool isTablet = screenWidth > 600;

    // Adjust height based on device type
    double carouselHeight = isTablet ? 200 :100; // Increase height for tablets

    return CarouselSlider.builder(
      itemCount: imageList.length,
      options: CarouselOptions(
        height: carouselHeight,
        aspectRatio: isTablet ? 4 / 3 : 16 / 9, // Adjust aspect ratio for tablets
        viewportFraction: 0.99,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1200),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      itemBuilder: (context, index, realIndex) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            imageList[index],
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        );
      },
    );
  }
}

