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
    return Scaffold(
      backgroundColor: const Color(0xffF7F5FF),
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                height: 250,
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
            // Available Doctors Section (now displayed as a grid)
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
            // Available Doctors GridView
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true, // Prevent infinite height issues in GridView
                physics: NeverScrollableScrollPhysics(), // Disable grid scrolling inside SingleChildScrollView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
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
  final String svgPath; // Path to the SVG icon
  final String label; // Button label text
  final Color backgroundColor; // Button background color
  final double width; // Button width
  final double height; // Button height
  final double iconSize; // Icon size
  final double borderRadius; // Border radius
  final TextStyle? textStyle; // Optional text style override

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
    // Access the current theme's text theme
    TextStyle defaultTextStyle =
        Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.black);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 0,
            blurRadius: 8, // Blur effect
            offset: Offset(0, 4), // Shadow position (4 px down)
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
              color: Color(0xff103757),
              width: iconSize,
              height: iconSize,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              label,
              style: textStyle ?? defaultTextStyle,
              maxLines: 2,
              textAlign: TextAlign.center, // Align text center
            ),
          ],
        ),
      ),
    );
  }
}
