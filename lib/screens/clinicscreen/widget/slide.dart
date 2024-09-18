import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/doc_slide1.png',
    'assets/images/doc_slide2.png',
    'assets/images/doc_slide3.png',
  ];

  @override
  @override
  Widget build(BuildContext context) {
    // Determine if the device is a tablet based on screen width
    bool isTablet = MediaQuery.of(context).size.width > 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 12.0 : 8.0, // More padding for tablets
        vertical: 12.0,
      ),
      child: CarouselSlider(
        options: CarouselOptions(
          height: isTablet ? 400 : 200, // Larger height for tablets
          autoPlay: true,
          enlargeCenterPage: false,
          autoPlayInterval: const Duration(seconds: 7), // Slide interval
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
      ),
    );
  }
}