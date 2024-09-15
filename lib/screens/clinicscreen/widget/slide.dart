import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/doc_slide1.png',
    'assets/images/doc_slide2.png',
    'assets/images/doc_slide3.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 215, // Adjust the height as needed
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: Duration(seconds: 7), // Slide interval
        aspectRatio: 16 / 9,
        viewportFraction: 1,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0),
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