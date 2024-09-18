import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialization;
  final String imageUrl;

  const DoctorCard({
    Key? key,
    required this.name,
    required this.specialization,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the screen is a tablet (width > 600px)
    bool isTablet = MediaQuery.of(context).size.width > 600;

    // Adjust card and image dimensions based on the screen size
    double cardWidth = isTablet ? 250 : 180;
    double cardHeight = isTablet ? 350 : 280;  // Increase the card height
    double imageHeight = isTablet ? 220 : 170; // Increase image height for better balance

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      width: cardWidth,  // Set dynamic width based on the screen size
      height: cardHeight, // Set dynamic height with more space
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
        children: [
          // Doctor Image (focus on face by aligning top and using BoxFit.cover)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Image.asset(
                imageUrl,
                height: imageHeight,  // Set dynamic image height
                width: double.infinity,
                fit: BoxFit.cover,  // Cover the entire space with the image
                alignment: Alignment.topCenter,  // Align the image to focus on the upper part (usually the face)
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor Name
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: isTablet ? 18 : 14,  // Adjust text size based on screen size
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                // Doctor Specialization
                Text(
                  specialization,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(
                        color: Colors.grey,
                        fontSize: isTablet ? 16 : 12,  // Adjust text size based on screen size
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
