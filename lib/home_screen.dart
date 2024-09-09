import 'package:flutter/material.dart';
import 'package:new_project/widget/carousel.dart';
import 'package:new_project/widget/elevated_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ResponsiveCarousel(),
            ),
            ResponsiveButton(
            text: "Your period is likely to start on or around 29 August", 
            onPressed: (){}
            ),
            CustomButtonLayout(),
          ],
        ),),
    );
  }
}



class CustomButtonLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Determine screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Check if the device is a tablet
    bool isTablet = screenWidth > 600;

    // Define the additional height for the big button
    double additionalHeight = isTablet ? 105.0 : 90.0; // Increase the height of the big button

    return SingleChildScrollView( // Enable scrolling if content overflows
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: isTablet ? 5 : 3, // Adjust flex for tablet
                  child: SizedBox(
                    height: (isTablet ? 2 * 26.0 : 2 * 20.0) + additionalHeight + 10.0, // Set height with additional height
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: isTablet ? 30.0 : 20.0), // Adjust padding for tablet
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("",height: isTablet ? 40.0 : 30.0, fit: BoxFit.cover,),// Adjust icon size for tablet
                          SizedBox(width: 8.0),
                          Text("Big Button", style: Theme.of(context).textTheme.titleLarge), // Adjust text size for tablet
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Space between big button and grid
                Flexible(
                  flex: isTablet ? 5 : 4, // Adjust flex for tablet
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 22.0 : 20.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.fastfood, size: isTablet ? 28.0 : 24.0), // Adjust icon size for tablet
                                  SizedBox(width: 8.0),
                                  Text("Check Up", style: Theme.of(context).textTheme.titleLarge), // Adjust text size for tablet
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0), // Space between buttons
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 24.0 : 20.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.local_taxi, size: isTablet ? 28.0 : 24.0), // Adjust icon size for tablet
                                  SizedBox(width: 8.0),
                                  Text("Clinic", style: Theme.of(context).textTheme.titleLarge), // Adjust text size for tablet
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.0), // Space between rows
                      Row(
                        children: [
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 21.0 : 20.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                 
                                  SizedBox(width: 4.0),
                                  Column(
                                    children: [
                                      Text("Join ", style: Theme.of(context).textTheme.titleLarge),
                                      Text("the movement", style: Theme.of(context).textTheme.titleLarge),
                                    ],
                                  ), // Adjust text size for tablet
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8.0), // Space between buttons
                          Flexible(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: isTablet ? 24.0 : 20.0), // Adjust padding for tablet
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(isTablet ? 20.0 : 16.0), // Adjust border radius for tablet
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.more_horiz, size: isTablet ? 28.0 : 24.0), // Adjust icon size for tablet
                                  SizedBox(width: 8.0),
                                  Text("Hotline", style: Theme.of(context).textTheme.titleLarge), // Adjust text size for tablet
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