import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_project/models/doctor_model.dart';

class DoctorCardAvailable extends StatelessWidget {
  final Doctor doctor;

  const DoctorCardAvailable({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    // Get screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600; // Tablet detection based on screen width

    return  Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image section with discount badge
              Expanded(
                flex: 2,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Image.asset(
                      doctor.imageUrl,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              // Product details section
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Product name
                      Text(
                        doctor.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold
                        )
                      ),
                      const SizedBox(height: 4),

                      Row(
                        children: [
                          Text(doctor.specialization,maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey
                            ),),
                        ],
                      ),

                        Row(
                          children: [
                            Icon(Icons.star,color: Colors.yellow,),
                            Text("${doctor.rating} (${doctor.reviews})",
                            maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                            ),
                            ),
                            const SizedBox(width: 10,),
                            SvgPicture.asset("assets/icon/Work.svg",height: 20,width: 20,color: Colors.grey,),
                            SizedBox(width: 4,),
                            Text("${doctor.experienceYears} year+ ",
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey
                            ),)
                          ],
                        ),

                        Text(
                            "\$${doctor.consultationFee.toStringAsFixed(2)}",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),

                      
                      // If there's a discount, show price after discount and original price in a row
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Discount badge using Stack, shown only if there is a discount
          
          

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
                      // Handle Add to Cart action
                    },
                    child:  Text(
                      'Add to Cart',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      height: 40, // Smaller size for the icon background
                      width: 40, // Make it circular
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white, // Border color
                          width: 1.5, // Border width
                        ),
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          'assets/icon/Heart.svg',
                          color: const Color(0xff64748B),
                          width: 24, // Icon size
                          height: 24, // Icon size
                        ),
                        onPressed: () {
                          // Action for the heart button
                        },
                      ),
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
