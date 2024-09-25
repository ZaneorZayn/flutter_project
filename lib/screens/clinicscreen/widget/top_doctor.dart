import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String specialization;
  final double containerWidth;
  final double containerHeight;
  final Color imageBackgroundColor; // Background color for the image section
  final Color textColor;
  final double imageHeight;
  final double imageWidth;
  final Color textBackgroundColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  final double borderRadius;

  const DoctorCard({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.specialization,
    this.containerWidth = 220,  // Same width as your previous DoctorCard
    this.containerHeight = 180, // Increased height for larger image
    this.imageBackgroundColor = const Color(0xFFFED3DD),  // Default background color for the image section
    this.textColor = Colors.black,
    this.imageHeight = 160, // Increased height for the doctor image
    this.imageWidth = 140,  // Adjust width for the doctor image
    this.textBackgroundColor = const Color(0xFFFCF1FF),
    this.textFontSize = 14.0, // Adjust font size for the text
    this.textFontWeight = FontWeight.w400,
    this.borderRadius = 12.0,
  }) : super(key: key);

  bool isTablet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth > 600;
  }

  @override
  Widget build(BuildContext context) {
    bool tablet = isTablet(context);

    // Adjust sizes based on whether the device is a tablet
    final double responsiveContainerWidth = tablet ? containerWidth * 1.2 : containerWidth;
    final double responsiveContainerHeight = tablet ? containerHeight * 1.2 : containerHeight;
    final double responsiveImageHeight = tablet ? imageHeight * 1.2 : imageHeight;
    final double responsiveImageWidth = tablet ? imageWidth * 1.2 : imageWidth;
    final double responsiveTextFontSize = tablet ? textFontSize * 1.2 : textFontSize;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: responsiveContainerWidth,
      height: responsiveContainerHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image container with background color and zoomed-in image at the top
          Container(
            width: double.infinity,
            height: responsiveImageHeight,
            decoration: BoxDecoration(
              color: imageBackgroundColor, // Background color for the image container
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                child: Image.asset(
                  imagePath,
                  width: responsiveImageWidth,
                  height: responsiveImageHeight,  // Adjusting height for zoom effect
                  fit: BoxFit.cover, 
                  alignment: Alignment.topCenter, // Use BoxFit.cover to zoom into the image
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor Name
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(),
                ),
                const SizedBox(height: 4),
                // Doctor Specialization
                Text(
                  specialization,
                   style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.grey
                   ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
