import 'package:flutter/material.dart';

class PngTextContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final double containerWidth;
  final double containerHeight;
  final Color backgroundColor;
  final Color textColor;
  final double imageHeight;
  final double imageWidth;
  final Color textBackgroundColor;
  final double textFontSize;
  final FontWeight textFontWeight;
  final double borderRadius;

  const PngTextContainer({
    Key? key,
    required this.imagePath,
    required this.text,
    this.containerWidth = 100,
    this.containerHeight = 140,
    this.backgroundColor = const Color(0xFFFED3DD),
    this.textColor = Colors.black,
    this.imageHeight = 70,
    this.imageWidth = 90,
    this.textBackgroundColor = const Color(0xFFFCF1FF),
    this.textFontSize = 10.24,
    this.textFontWeight = FontWeight.w400,
    this.borderRadius = 12.0,
  }) : super(key: key);

  bool isTablet(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double aspectRatio = screenWidth / screenHeight;
    return (screenWidth > 600 && aspectRatio < 1.5);
  }

  @override
  Widget build(BuildContext context) {
    bool tablet = isTablet(context);

    // Adjust sizes based on whether the device is a tablet
    final double responsiveContainerWidth = tablet ? containerWidth * 1.5 : containerWidth;
    final double responsiveContainerHeight = tablet ? containerHeight * 1.5 : containerHeight;
    final double responsiveImageHeight = tablet ? imageHeight * 1.5 : imageHeight;
    final double responsiveImageWidth = tablet ? imageWidth * 1.5 : imageWidth;
    final double responsiveTextFontSize = tablet ? textFontSize * 1.5 : textFontSize;

    return Container(
      width: responsiveContainerWidth,
      height: responsiveContainerHeight,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 4,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: responsiveContainerHeight - 40, // Adjusting space for the text section
            padding: const EdgeInsets.all(8),
            decoration: ShapeDecoration(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
              ),
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: responsiveImageWidth,
                height: responsiveImageHeight,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: ShapeDecoration(
              color: textBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius),
                ),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: responsiveTextFontSize,
                    fontWeight: textFontWeight,
                    color: textColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
