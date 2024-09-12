import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categories = ["Sexual Health", "Menstrual Health", "Pregnancy"];

  // The currently selected category index
  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this); // 5 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F5FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140), // Adjusted height for AppBar
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0, // Remove the black shadow line (elevation)
          flexibleSpace: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffF49EC4), Color(0xffF9C0C7)], // Gradient colors
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'All Content',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Colors.black),
                    ),
                    Text(
                      'Explore good blog and Q&A',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icon/Search1.svg",
                          color: Colors.grey,
                          width: 24,
                          height: 24,
                        ),
                        onPressed: () {
                          // Search action
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: SvgPicture.asset(
                          "assets/icon/bookmark.svg",
                          color: Colors.grey,
                          height: 24,
                          width: 24,
                        ),
                        onPressed: () {
                          // Bookmark action
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(100), // Adjusted height to accommodate categories
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white, // White background for TabBar
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.transparent, // Make sure there's no bottom border
                        width: 0.0,
                      ),
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: false, // Tabs are not scrollable
                    indicatorColor: const Color(0xffF49EC4), // Default indicator color
                    labelColor: const Color(0xffF49EC4), // Label color when selected
                    unselectedLabelColor: const Color(0xff64748B), // Unselected label color
                    indicatorSize: TabBarIndicatorSize.label, // Adjust to fit the label
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    tabs: const [
                      Tab(text: "All"),
                      Tab(text: "Q&A"),
                      Tab(text: "Blog"),
                      Tab(text: "Videos"),
                      Tab(text: "My Post"),
                    ],
                  ),
                ),
               
                // Horizontal ListView for category buttons
                
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          
          Center(child: Text("All Content")),
          Center(child: Text("Q&A")),
          Center(child: Text("Blog")),
          Center(child: Text("Videos")),
          Center(child: Text("My Post")),
        ],
      ),
    );
  }
}

// Custom CategoryButton widget
class CategoryButton extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CategoryButton({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Reduced padding for smaller buttons
      decoration: BoxDecoration(
        color: isSelected ? Colors.pinkAccent : Colors.grey[300],
        borderRadius: BorderRadius.circular(20), // Smaller border radius for smaller buttons
        border: isSelected
            ? Border.all(color: Colors.pinkAccent, width: 2)
            : Border.all(color: Colors.transparent),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          fontSize: 12, // Smaller font size
        ),
      ),
    );
  }
}
