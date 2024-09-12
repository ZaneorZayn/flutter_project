import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtonLayout extends StatelessWidget {
  const CustomButtonLayout({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Check if the device is a tablet
    bool isTablet = screenWidth > 600;

    // Define the additional height for the big button
    double additionalHeight = isTablet ? 105.0 : 90.0; // Increase the height of the big button

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: isTablet ? 5 : 4, // Adjust flex for tablet
                  child: SizedBox(
                    height: (isTablet ? 2 * 30.0 : 2 * 12.0) + additionalHeight + 10.0, // Set height with additional height
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff064B75),
                        padding: EdgeInsets.symmetric(horizontal: isTablet ? 8 : 5), // Adjust padding for tablet
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Doctor",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2DB1E5),
                                    ),
                              ),
                              Text(
                                "Appointment",
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff2DB1E5),
                                    ),
                              ),
                            ],
                          ), // Adjust text size for tablet
                          const SizedBox(width: 8.0),
                          Image.asset(
                            "assets/images/doctor.png",
                            height: isTablet ? 190.0 : 210.0, // Increase height for larger image
                            width: isTablet ? 90.0 : 60.0, // Increase width for larger image
                            fit: BoxFit.cover, // Ensure the image fits within the set dimensions
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 7.1), // Space between big button and grid
                Flexible(
                  flex: isTablet ? 6 : 5, // Adjust flex for tablet
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffF9C0C7),
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 22.0 : 12.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Check Up",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff59315E),
                                        ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  SvgPicture.asset(
                                    'assets/icon/calen.svg',
                                    width: isTablet ? 28.0 : 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0), // Space between buttons
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff74D1F6),
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 24.0 : 14.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Clinic",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff002A4C),
                                        ),
                                  ), // Adjust text size for tablet
                                  const SizedBox(width: 8.0),
                                  SvgPicture.asset(
                                    'assets/icon/clinic.svg',
                                    width: isTablet ? 28.0 : 24.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0), // Space between rows
                      Row(
                        children: [
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff351238),
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 24.0 : 14.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 6.0),
                                  Column(
                                    children: [
                                      Text(
                                        "Join The",
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Color(0xffF49EC4),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        "Movement",
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                              color: Color(0xffF49EC4),
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ],
                                  ), // Adjust text size for tablet
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8.0), // Space between buttons
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff14697E),
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 24.0 : 17.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Hotline",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xffF8BAC6),
                                        ),
                                  ), // Adjust text size for tablet
                                  const SizedBox(width: 8.0),
                                  SvgPicture.asset(
                                    "assets/icon/hotline.svg",
                                    width: isTablet ? 28.0 : 20.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
