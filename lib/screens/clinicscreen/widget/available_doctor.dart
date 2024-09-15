import 'package:flutter/material.dart';
import 'package:new_project/models/doctor_model.dart';

class DoctorCardAvailable extends StatelessWidget {
  final Doctor doctor;

  const DoctorCardAvailable({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      width: 195, // Set width for horizontal scrolling cards
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Doctor Image with Online label
          ClipRRect(
            borderRadius:const  BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Stack(
              children: [
                Image.asset(
                  doctor.imageUrl,
                  height: 90,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
                // "Online" label at the top-left corner if doctor is online
                if (doctor.isOnline)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding:const  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'ONLINE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Doctor Name
                Text(
                  doctor.name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // Doctor Specialization
                Text(
                  doctor.specialization,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                // Rating, Reviews, and Experience
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow[700], size: 16),
                    const SizedBox(width: 3),
                    Text(
                      "${doctor.rating} (${doctor.reviews})",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 6),
                    const Icon(Icons.work, size: 16, color: Colors.blue),
                    const SizedBox(width: 4),
                    Text(
                      "${doctor.experienceYears}+ Years",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // Consultation Fee
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "\$${doctor.consultationFee.toStringAsFixed(2)} ",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                      ),
                      TextSpan(
                        text: "Inc. VAT",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Use Expanded to avoid overflow and ensure the button is placed at the bottom
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle button press
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape:const  RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "SEE DOCTOR NOW",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      //(Icons.video_call, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
