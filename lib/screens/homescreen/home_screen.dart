import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_project/models/blog_model.dart';
import 'package:new_project/models/product_model.dart';
import 'package:new_project/screens/homescreen/widgets/carousel.dart';
import 'package:new_project/screens/homescreen/widgets/elevated_button.dart';
import 'package:new_project/screens/homescreen/widgets/nested_button.dart';
import 'package:new_project/screens/homescreen/widgets/png_container.dart';
import 'package:new_project/widget/productcard.dart';
import 'package:new_project/widget/blog_card.dart';


// Fake Q&A data

final List<Map<String, String>> qandaData = [
  {
    "question": "What are the symptoms of menstrual cramps?",
    "poster": "Anna Williams",
    "date": "2 days ago",
    "answers": "2 doctors answered",
    "views": "120 views",
    "comments": "5 comments",
    "image": "https://via.placeholder.com/150",
  },
  {
    "question": "How can I improve my sexual health?",
    "poster": "John Doe",
    "date": "3 days ago",
    "answers": "1 doctor answered",
    "views": "85 views",
    "comments": "8 comments",
    "image": "https://via.placeholder.com/150",
  },
  {
    "question": "What are the safest contraceptive methods?",
    "poster": "Sarah Connor",
    "date": "1 week ago",
    "answers": "3 doctors answered",
    "views": "230 views",
    "comments": "12 comments",
    "image": "https://via.placeholder.com/150",
  },
  {
    "question": "How do I know if I am pregnant?",
    "poster": "Emily Rose",
    "date": "5 days ago",
    "answers": "4 doctors answered",
    "views": "300 views",
    "comments": "15 comments",
    "image": "https://via.placeholder.com/150",
  },
  {
    "question": "How can I track my menstrual cycle?",
    "poster": "Rachel Green",
    "date": "4 days ago",
    "answers": "2 doctors answered",
    "views": "150 views",
    "comments": "6 comments",
    "image": "https://via.placeholder.com/150",
  },
  {
    "question": "Can contraceptives cause weight gain?",
    "poster": "Monica Geller",
    "date": "2 weeks ago",
    "answers": "3 doctors answered",
    "views": "180 views",
    "comments": "9 comments",
    "image": "https://via.placeholder.com/150",
  },
  {
    "question": "What is the best way to deal with menopause symptoms?",
    "poster": "Lisa Kudrow",
    "date": "1 week ago",
    "answers": "2 doctors answered",
    "views": "90 views",
    "comments": "4 comments",
    "image": "https://via.placeholder.com/150",
  },
  {
    "question": "How to deal with postnatal depression?",
    "poster": "Phoebe Buffay",
    "date": "3 weeks ago",
    "answers": "4 doctors answered",
    "views": "250 views",
    "comments": "18 comments",
    "image": "https://via.placeholder.com/150",
  },
];

// QandACard Widget
class QandACard extends StatelessWidget {
  final String question;
  final String poster;
  final String date;
  final String answers;
  final String views;
  final String imageUrl;

  const QandACard({
    Key? key,
    required this.question,
    required this.poster,
    required this.date,
    required this.answers,
    required this.views,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Displaying the poster's profile and details
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
            title: Text(
              poster,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            subtitle: Text(
              date,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ),
          
          // Displaying the question
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              question,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: const Color(0xff61646B),
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          
          // Displaying the user comment, doctor answers, and view count with icons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                SvgPicture.asset("assets/icon/comment.svg"),
                const SizedBox(width: 2),
                Text(
                  "", // Replace with dynamic data if you have user comment
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xff61646B),
                      ),
                ),
                const SizedBox(width: 16),
                 SvgPicture.asset("assets/icon/comment.svg"),
                   
                const SizedBox(width: 2),
                Text(
                  answers, // Displaying doctor answers dynamically
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xff61646B),
                      ),
                ),
                const SizedBox(width: 16),
                  SvgPicture.asset("assets/icon/view.svg"),
                const SizedBox(width: 2),
                Text(
                  views, // Displaying the view count dynamically
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: const Color(0xff61646B),
                      ),
                ),
              ],
            ),
          ),
          
          // Adding a divider and a "See more Detail" button
          const Divider(color: Colors.grey, endIndent: 1.5),
          TextButton(
            onPressed: () {
              // Add functionality for 'See more Detail' here
            },
            child: Center(
              child: Text(
                "See more Detail",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xff351238),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



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
        preferredSize: const Size.fromHeight(80.0), // Increased height for AppBar
        child: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: const EdgeInsets.only(left: 14.0,),
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
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/viya_logo.png",
                  width: logoSize,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.transparent, // Make the background transparent to show gradient
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
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
            ),
          ],
        ),
      ),
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8,left: 4,right:4),
              child: ResponsiveCarousel(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6,left:2,right: 2),
              child: ResponsiveButton(
                text: "Your period is likely to start on or around 29 August",
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4),
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
                    padding: const EdgeInsets.only(left: 8.0, top: 6),
                    child: Text(
                      "Get Answers",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff61646B),
                          ),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    color: Colors.white,
                    height: isTablet ? 200 : 152, // Set a fixed height for the horizontal list
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1.0),
                      child: ListView(
                        scrollDirection: Axis.horizontal, // Make the ListView horizontal
                        children: const [
                          PngTextContainer(
                            imagePath: 'assets/images/SexualHealth.png',
                            text: "Sexual Health",
                          ),
                          SizedBox(width: 10),
                          PngTextContainer(
                            imagePath: 'assets/images/MenstrualHealth.png',
                            text: "Menstrual Health",
                            backgroundColor: Color(0xffD2FEFF),
                          ),
                          SizedBox(width: 10),
                          PngTextContainer(
                            imagePath: 'assets/images/Contraception.png',
                            text: "Contraception",
                            backgroundColor: Color(0xffD0FFEF),
                          ),
                          SizedBox(width: 10),
                          PngTextContainer(
                            imagePath: 'assets/images/Pregnancy.png',
                            text: "Pregnancy",
                            backgroundColor: Color(0xffFFD2A8),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Additional content below
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
                    child: Text(
                      "Recent Blogs",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff61646B),
                      ),
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
              height: isTablet ? 350 : 220, // Set a fixed height for horizontal ListView
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
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff61646B),
                      ),
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
              height: isTablet ? 380 : 290, // Set a fixed height for horizontal ListView
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productData.length, // Make sure itemCount is set
                itemBuilder: (context, index) {
                  final product = productData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: SizedBox(
                      width: isTablet ? 370 : 230, // Provide a fixed width for each ProductCard
                      height: isTablet ? 280 : 230,
                      child: Productcard(product: product),
                    ),
                  );
                },
              ),
            ),
            // Add QandA Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Popular Q&A",
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff61646B),
                      ),
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
            // QandA Cards Vertical ListView
            ListView.builder(
              itemCount: qandaData.length, // Use qandaData.length
              shrinkWrap: true, // Ensures it takes only necessary height
              physics: const NeverScrollableScrollPhysics(), // Disable scrolling for the list
              itemBuilder: (context, index) {
                final qanda = qandaData[index];
                return QandACard(
                  question: qanda['question']!,
                  poster: qanda['poster']!,
                  date: qanda['date']!,
                  answers: qanda['answers']!,
                  views: qanda['views']!,
                  imageUrl: qanda['image']!,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
Widget buildDrawer(BuildContext context) {
  return Drawer(
    child: Column(
      children: [
        // Wrap the UserAccountsDrawerHeader in a Container to manage margins and padding
        Container(
          color: Colors.white, // Match this color with your header background
          child: const UserAccountsDrawerHeader(
            margin: EdgeInsets.zero, // Removes the default margin
            accountName: Text(
              'John Doe',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            accountEmail: Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Avatar.png'), // Replace with your profile image path
            ),
            decoration: BoxDecoration(
              color: Colors.white, // Header background color
            ),
          ),
        ),

        // Drawer Items
        ListTile(
          leading: SvgPicture.asset("assets/icon/home1.svg"),
          title:  Text('Home',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icon/document.svg"),
          title:  Text('Our purposes',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icon/document.svg"),
          title:  Text('Contact us ',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icon/comments.svg"),
          title:  Text('Chat',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icon/bell.svg"),
          title:  Text('Notification',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icon/bookmark.svg"),
          title:  Text('Bookmark',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icon/cart.svg",width: 30,height: 30,),
          title:  Text('My Cart',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        ListTile(
          leading: SvgPicture.asset("assets/icon/user.svg"),
          title:  Text('My Profile',style: Theme.of(context).textTheme.headlineMedium,),
          onTap: () {
            // Handle navigation to home
          },
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: ElevatedButton(
              style:ElevatedButton.styleFrom(
                backgroundColor: Color(0xff002A4C),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                )
              ) ,
              onPressed: (){}, child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icon/sign_out.svg",color: Colors.white,),
                  const SizedBox(width: 8,),
                  Text("Sign Out",style: TextStyle(color: Colors.white),)

            ],
          )),
        )
      ],
    ),
  );
}

void showCustomPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(26),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Row with "Hotline" text and close button
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(

                  children: [
                    Text(
                      'Hotline',
                      style: Theme.of(context).textTheme.headlineLarge
                    ),
                    const SizedBox(width: 45,),
                    Container(
                      margin: EdgeInsets.only(right: 5),
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,

                        border: Border.all(color: Colors.black)
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the popup
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              // Container with an image
              Container(
                height: 150, // Adjust the height as needed
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/hotline.jpg", // Replace with your image URL or asset
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter
                  ),
                ),
              ),
              const SizedBox(height: 20), // Space between the container and buttons
              // Column with three buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for Button 1
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Button 1'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for Button 2
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Button 2'),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for Button 3
                        Navigator.of(context).pop(); // Close the popup
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Button 3'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}