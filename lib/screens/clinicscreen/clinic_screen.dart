import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/models/doctor_model.dart';
import 'package:new_project/screens/clinicscreen/widget/appbar.dart';
import 'package:new_project/screens/clinicscreen/widget/available_doctor.dart';
import 'package:new_project/screens/clinicscreen/widget/slide.dart';
import 'package:new_project/screens/clinicscreen/widget/top_doctor.dart';

class ClinicScreen extends StatelessWidget {
  const ClinicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if the screen is a tablet (based on width greater than 600px)
    bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xffF7F5FF),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ImageSlider(),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: SvgButton(
                      svgPath: "assets/icon/Group.svg",
                      label: "Doctor",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SvgButton(
                      svgPath: "assets/icon/Calander.svg",
                      label: "Appointment",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SvgButton(
                      svgPath: "assets/icon/prescription.svg",
                      label: "Prescription",
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: SvgButton(
                      svgPath: "assets/icon/medicine.svg",
                      label: "Medicine",
                    ),
                  ),
                ],
              ),
            ),
            // Top Doctors Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Doctors",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
            // Top Doctors ListView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: isTablet?310 : 245,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    final doctor = doctors[index];
                    return DoctorCard(
                      name: doctor.name,
                      imageUrl: doctor.imageUrl,
                      specialization: doctor.specialization,
                    );
                  },
                ),
              ),
            ),
            // Available Doctors Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Available Doctors",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ),
                ],
              ),
            ),
            // Available Doctors GridView with responsive columns for tablet and mobile
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true, // Prevent infinite height issues in GridView
                physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling inside SingleChildScrollView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTablet ? 3 : 2, // Show 3 columns on tablet, 2 on mobile
                  crossAxisSpacing: 5, // Horizontal space between grid items
                  mainAxisSpacing: 5, // Vertical space between grid items
                  childAspectRatio: 0.75, // Adjust the aspect ratio of each grid item
                ),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorCardAvailable(
                    doctor: doctor,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SvgButton extends StatelessWidget {
  final String svgPath;
  final String label;
  final Color backgroundColor;
  final double width;
  final double height;
  final double iconSize;
  final double borderRadius;
  final TextStyle? textStyle;

  const SvgButton({
    Key? key,
    required this.svgPath,
    required this.label,
    this.backgroundColor = Colors.white,
    this.width = 100,
    this.height = 100,
    this.iconSize = 45,
    this.borderRadius = 16,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine if the screen is a tablet (width > 600px)
    bool isTablet = MediaQuery.of(context).size.width > 600;

    // Adjust sizes based on screen size
    double adjustedWidth = isTablet ? 140 : width;
    double adjustedHeight = isTablet ? 150 : height;
    double adjustedIconSize = isTablet ? 60 : iconSize;
    

    return Container(
      width: adjustedWidth,
      height: adjustedHeight,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgPath,
              color: const Color(0xff103757),
              width: adjustedIconSize,
              height: adjustedIconSize,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              label,
              
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.black
              ),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

