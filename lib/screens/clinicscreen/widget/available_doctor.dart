import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/models/doctor_model.dart';

class DoctorCardAvailable extends StatelessWidget {
  final Doctor doctor;

  const DoctorCardAvailable({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with a possible online badge
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6.0),
                        child: Image.asset(
                          doctor.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // "Online" badge
                    if (doctor.isOnline)
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Online',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),

              // Doctor details section
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Doctor name
                      Text(
                        doctor.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),

                      // Specialization
                      Text(
                        doctor.specialization,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(height: 4),

                      // Rating, experience, and reviews row
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Text(
                            "${doctor.rating} (${doctor.reviews})",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                          ),
                          const SizedBox(width: 10),
                          SvgPicture.asset(
                            "assets/icon/Work.svg",
                            height: 20,
                            width: 20,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "${doctor.experienceYears} year+ ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Consultation fee and VAT
                      Row(
                        children: [
                          Text(
                            "\$${doctor.consultationFee.toStringAsFixed(2)} ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'Inc.VAT',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Add to Cart Button using Align
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity, // Button takes full width
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Color(0xff74D1F6), // Background color for button
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      // Handle See Doctor action
                    },
                    child: Text(
                      'See Doctor',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        'assets/icon/videocall.svg',
                        color: Colors.white,
                        width: 16, // Icon size
                        height: 16, // Icon size
                      ),
                      onPressed: () {
                        // Action for the videocall button
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
