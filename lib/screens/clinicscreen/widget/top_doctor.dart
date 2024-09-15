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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: 175, // Set width for horizontal scrolling cards
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
          children: [
            // Doctor Image (Zoomed in on the face)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                height: 140, // Adjusted height for the image
                width: double.infinity,
                fit: BoxFit.cover, // Zoom in on the face
                alignment: Alignment.topCenter, // Focus on the top part of the image (face)
              ),
            ),
            SizedBox(height: 10),
            // Doctor Name
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
              textAlign: TextAlign.left, // Align text to the left
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Handle long names
            ),
            SizedBox(height: 4),
            // Doctor Specialization
            Text(
              specialization,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: Colors.grey),
              textAlign: TextAlign.left, // Align text to the left
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
