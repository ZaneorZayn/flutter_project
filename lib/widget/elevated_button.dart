import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  ResponsiveButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Determine screen width
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine if the device is a tablet
    bool isTablet = screenWidth > 600;

    // Define padding, font size, and other properties based on the device type
    double paddingVertical = isTablet ? 18.0 : 12.0;
    double paddingHorizontal =  isTablet ? 18 : 14;
    double fontSize = isTablet ? 20.0 : 16.0;
    double borderRadius = isTablet ? 12.0 : 8.0;

    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: paddingHorizontal),
      child: SizedBox(
        width: double.infinity, // Make the button take up all the width
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: paddingVertical,
              horizontal: 0, // Horizontal padding is not needed because we want full width
            ),
            textStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          child: Text(text,
          style: Theme.of(context).textTheme.headlineSmall,),
        ),
      ),
    );
  }
}