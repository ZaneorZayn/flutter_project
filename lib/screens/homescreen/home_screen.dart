import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/models/blog_model.dart';
import 'package:new_project/models/product_model.dart';
import 'package:new_project/screens/homescreen/widgets/carousel.dart';
import 'package:new_project/screens/homescreen/widgets/elevated_button.dart';
import 'package:new_project/screens/homescreen/widgets/nested_button.dart';
import 'package:new_project/screens/homescreen/widgets/png_container.dart';
import 'package:new_project/widget/blog_card.dart';
import 'package:new_project/widget/product_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isTablet = screenWidth > 600;
    double logoSize = isTablet ? 200 : 150;

    return Scaffold(
      backgroundColor: const Color(0xffF7F5FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0), // Increased height for AppBar
        child: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icon/drawer.svg',
                      color: const Color(0xff64748B),
                      width: 26,
                      height: 26,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer(); // Open the drawer
                    },
                  ),
                ),
              );
            },
          ),
          automaticallyImplyLeading: false,
          elevation: 2, // Set elevation
          shadowColor: Colors.black, // Shadow color
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffF49EC4), Color(0xffF9C0C7)], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: Row(
            children: [
              Image.asset(
                "assets/images/viya_logo.png",
                width: logoSize,
                fit: BoxFit.contain,
              ),
            ],
          ),
          backgroundColor: Colors.transparent, // Make the background transparent to show gradient
          actions: [
            Row(
              children: [
                Container(
                  height: 40, // Smaller size for the icon background
                  width: 40, // Make it circular
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icon/bell.svg',
                      color: const Color(0xff64748B),
                      width: 24, // Icon size
                      height: 24, // Icon size
                    ),
                    onPressed: () {
                      // Action for the bell button
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 40, // Same size for consistency
                  width: 40, // Make it circular
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: SvgPicture.asset(
                      'assets/icon/chat.svg',
                      color: const Color(0xff64748B),
                      width: 28, // Icon size
                      height: 28, // Icon size
                    ),
                    onPressed: () {
                      // Action for the comment button
                    },
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffF49EC4), Color(0xffF9C0C7)], // Gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                // Handle home navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings navigation
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ResponsiveCarousel(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ResponsiveButton(
                text: "Your period is likely to start on or around 29 August",
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: CustomButtonLayout(),
            ),
            // Horizontal scrollable list of PngTextContainer
            Container(
              margin: const EdgeInsets.symmetric(vertical: 9.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    offset: const Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title "Get Answers"
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 15),
                    child: Text(
                      "Get Answers",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff61646B),
                          ),
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  SizedBox(
                    height: isTablet ? 192 : 132, // Set a fixed height for the horizontal list
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal, // Make the ListView horizontal
                        children: const [
                          PngTextContainer(
                            imagePath: 'assets/images/SexualHealth.png',
                            text: "Sexual Health",
                          ),
                          SizedBox(width: 12),
                          PngTextContainer(
                            imagePath: 'assets/images/MenstrualHealth.png',
                            text: "Menstrual Health",
                            backgroundColor: Color(0xffD2FEFF),
                          ),
                          SizedBox(width: 12),
                          PngTextContainer(
                            imagePath: 'assets/images/Contraception.png',
                            text: "Contraception",
                            backgroundColor: Color(0xffD0FFEF),
                          ),
                          SizedBox(width: 12),
                          PngTextContainer(
                            imagePath: 'assets/images/Pregnancy.png',
                            text: "Pregnancy",
                            backgroundColor: Color(0xffFFD2A8),
                          ),
                          SizedBox(width: 12),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Additional content below
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Recent Blogs",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
            // Blog Cards Horizontal Scroll
            Container(
              height: isTablet ?350 : 220, // Set a fixed height for horizontal ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: blogData.length, // Make sure itemCount is set
                itemBuilder: (context, index) {
                  final blog = blogData[index];
                  return SizedBox(
                    width: isTablet ? 370 : 270, // Provide a fixed width for each BlogCard
                    child: BlogCard(blog: blog),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Popular Products",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View All",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: isTablet ?350 : 290, // Set a fixed height for horizontal ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productData.length, // Make sure itemCount is set
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return SizedBox(
                    width: isTablet ? 370 : 270, // Provide a fixed width for each BlogCard
                    child: ProductCard(product: product,),
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
