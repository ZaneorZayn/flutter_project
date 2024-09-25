import 'package:flutter/material.dart';
import 'package:new_project/screens/blogscreen/question_detail.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<String> contentTypes = ["All", "Blog", "Q&A", "Videos", "My Post"];
  final List<String> categories = [
    "Sexual Health",
    "Menstrual Health",
    "Pregnancy",
    "Contraception"
  ];

  int selectedContentTypeIndex = 0;
  int selectedCategoryIndex = 0;

  // Mocked "My Post" data (currently empty)
  List<Map<String, String>> myPostData = [];

  // Function to update the selected content type index
  void _onContentTypeSelected(int index) {
    setState(() {
      selectedContentTypeIndex = index;
    });
  }

  // Function to update the selected category index
  void _onCategorySelected(int index) {
    setState(() {
      selectedCategoryIndex = index;
    });
  }

  // Function to show content for "My Post" page
  Widget buildMyPostWidget() {
    if (myPostData.isEmpty) {
      // No data: show an SVG image
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/empty.png', // Add your SVG asset here
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 16),
          ],
        ),
      );
    } else {
      // Data exists: show the list of posts
      return ListView.builder(
        itemCount: myPostData.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final post = myPostData[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(post['image']!),
              ),
              title: Text(post['title']!),
              subtitle: Text(post['date']!),
            ),
          );
        },
      );
    }
  }

  // Mocked YouTube video data
  List<Map<String, String>> videoData = [
    {
      "title": "Pregnancy Tips for a Healthy Baby",
      "videoUrl": "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
      "category": "Pregnancy",
    },
    {
      "title": "Understanding Contraception",
      "videoUrl": "https://www.youtube.com/watch?v=wfD7ZQhwACU",
      "category": "Contraception",
    },
    {
      "title": "Sexual Health & Relationships",
      "videoUrl": "https://www.youtube.com/watch?v=jtYk3gWRSw0&list=PLjxrf2q8roU33POuWi4bK0zvDpAHK6759&index=23",
      "category": "Sexual Health",
    },
    {
      "title": "How To Maintain Menstrual Health",
      "videoUrl": "https://www.youtube.com/watch?v=JTk2Exr7FO4&list=PLjxrf2q8roU33POuWi4bK0zvDpAHK6759&index=2",
      "category": "Menstrual Health",
    },
  ];

  // Mocked blog data
  List<Map<String, String>> blogData = [
    {
      "title": "ONCE INSERTED, DOES THE IMPLANT MOVE AROUND MY BODY?",
      "poster": "VIYA",
      "date": "2 days ago",
      "category": "Contraception",
      "image": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJA8LE-4lJ70o2TfGSZd5vbHeDC_-sn6KfGQ&s",
    },
    {
      "title": "WHAT ARE THE SIDE EFFECTS OF CONTRACEPTION?",
      "poster": "Dr. Sarah Lee",
      "date": "3 days ago",
      "category": "Contraception",
      "image": "https://via.placeholder.com/300",
    },
    {
      "title": "HOW TO MAINTAIN MENSTRUAL HEALTH DURING STRESS?",
      "poster": "Health Insider",
      "date": "1 week ago",
      "category": "Menstrual Health",
      "image": "https://via.placeholder.com/300",
    },
    {
      "title": "PREGNANCY MYTHS DEBUNKED",
      "poster": "Motherhood Guide",
      "date": "5 days ago",
      "category": "Pregnancy",
      "image": "https://via.placeholder.com/300",
    },
    {
      "title": "SEXUAL HEALTH: UNDERSTANDING INTIMACY",
      "poster": "Love Wellness",
      "date": "1 day ago",
      "category": "Sexual Health",
      "image": "https://via.placeholder.com/300",
    },
  ];

  // Mocked Q&A data
  List<Map<String, String>> qaData = [
    {
      "question": "What Is Sexual Health, And Why Is It Important?",
      "poster": "Chanda Hit",
      "date": "2 days ago",
      "answers": "0 doctor answered",
      "comments": "2",
      "view": "150",
      "category": "Sexual Health",
      "profileImage": "https://via.placeholder.com/50",
    },
    {
      "question": "Can Contraceptives Cause Weight Gain?",
      "poster": "Rachel S",
      "date": "5 days ago",
      "answers": "1 doctor answered",
      "comments": "3",
      "view": "200",
      "category": "Contraception",
      "profileImage": "https://via.placeholder.com/50",
    },
    {
      "question": "How Can I Track My Menstrual Cycle?",
      "poster": "Grace O.",
      "date": "3 days ago",
      "answers": "2 doctor answered",
      "comments": "5",
      "view": "300",
      "category": "Menstrual Health",
      "profileImage": "https://via.placeholder.com/50",
    },
    {
      "question": "What Are The Early Signs Of Pregnancy?",
      "poster": "Annie M",
      "date": "1 week ago",
      "answers": "3 doctor answered",
      "comments": "4",
      "view": "500",
      "category": "Pregnancy",
      "profileImage": "https://via.placeholder.com/50",
    },
  ];

  // Function to filter content based on selected category
  List<Map<String, String>> filterDataByCategory(List<Map<String, String>> data) {
    if (selectedContentTypeIndex == 0) {
      // If "All" content is selected, show all data
      return data;
    }
    return data
        .where((item) => item['category'] == categories[selectedCategoryIndex])
        .toList();
  }

  // Widget to display YouTube videos
  Widget buildVideoWidget() {
  List<Map<String, String>> videos = filterDataByCategory(videoData);
  return ListView.builder(
    itemCount: videos.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      String? videoId = YoutubePlayer.convertUrlToId(videos[index]['videoUrl']!);
      YoutubePlayerController _controller = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Set the border radius for the entire card
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), // Top-left border radius
                topRight: Radius.circular(12), // Top-right border radius
              ),
              child: YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                videos[index]['title']!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  SvgPicture.asset("assets/icon/comment.svg"),
                  const SizedBox(width: 4),
                  Text(
                    "8 comments", // Replace with dynamic data if available
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset("assets/icon/comment.svg"),
                  const SizedBox(width: 4),
                  Text(
                    "1 doctor answer", // Replace with dynamic data if available
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset("assets/icon/view.svg"),
                  const SizedBox(width: 4),
                  Text(
                    "350 views", // Replace with dynamic data if available
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xff074B78), endIndent: 1.5),
            TextButton(
              onPressed: () {
                // Handle see more action
              },
              child: Center(
                child: Text(
                  "See more detail",
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
    },
  );
}


  // Widget to display blogs
  Widget buildBlogWidget() {
    List<Map<String, String>> blogs = filterDataByCategory(blogData);
    return ListView.builder(
      itemCount: blogs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final blog = blogs[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(blog['image']!),
                ),
                title: Text(blog['poster']!, style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),),
                subtitle: Text(blog['date']!, style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  blog['title']!,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  blog['image']!,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icon/comment.svg"),
                    const SizedBox(width: 4),
                    Text(
                      "10 comments", // Replace with dynamic data if available
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset("assets/icon/comment.svg"),
                    const SizedBox(width: 4),
                    Text(
                      "2 doctor answers", // Replace with dynamic data if available
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                    const SizedBox(width: 12),
                    SvgPicture.asset("assets/icon/view.svg"),
                    const SizedBox(width: 4),
                    Text(
                      "500 views", // Replace with dynamic data if available
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const Divider(color: Color(0xff074B78), endIndent: 1.5),
              TextButton(
                onPressed: () {
                  // Handle see more action
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
      },
    );
  }

  // Widget to display Q&A
  // Widget to display Q&A
Widget buildQandAWidget() {
  List<Map<String, String>> qas = filterDataByCategory(qaData);
  return ListView.builder(
    itemCount: qas.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      final qa = qas[index];
      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(qa['profileImage']!),
              ),
              title: Text(
                qa['poster']!,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black,
                    ),
              ),
              subtitle: Text(
                qa['date']!,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: const Color(0xff61646B),
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                qa['question']!,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: const Color(0xff61646B),
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                 SvgPicture.asset("assets/icon/comment.svg"),
                  const SizedBox(width: 4),
                  Text(
                    "${qa['comments']} comments", // Display the number of comments
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 12),
                 SvgPicture.asset("assets/icon/comment.svg"),
                  const SizedBox(width: 4),
                  Text(
                    qa['answers']!, // Display doctor comments
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(width: 12),
                  SvgPicture.asset("assets/icon/view.svg"),
                  const SizedBox(width: 4),
                  Text(
                    "${qa['view']} views", // Display views
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xff074B78), endIndent: 1.5),
            TextButton(
              onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context)=> QADetailScreen(qaData: qa)));
                // Handle see more action
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
    },
  );
}


  // Widget to display both Blogs, Q&A, and Videos mixed (for "All" content)
  Widget buildAllContentWidget() {
    return Column(
      children: [
        buildVideoWidget(), // Shows YouTube videos
        buildBlogWidget(), // Shows blogs
        buildQandAWidget(), // Shows Q&A
      ],
    );
  }

  // Widget to display content based on selected content type
  Widget getContentWidget() {
    if (selectedContentTypeIndex == 0) {
      return buildAllContentWidget(); // If "All" is selected, show all
    } else if (selectedContentTypeIndex == 1) {
      return buildBlogWidget(); // If "Blog" is selected
    } else if (selectedContentTypeIndex == 2) {
      return buildQandAWidget(); // If "Q&A" is selected
    } else if (selectedContentTypeIndex == 3) {
      return buildVideoWidget(); // If "Videos" is selected
    } else if (selectedContentTypeIndex == 4) {
      return buildMyPostWidget(); // If "My Post" is selected
    }
    return buildAllContentWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F5FF), // Set background color here
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: Container(
            padding: const EdgeInsets.only(left: 16, right: 16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffF49EC4), Color(0xffF9C0C7)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'All Content',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge
                            ?.copyWith(color: Colors.black),
                      ),
                      Text(
                        'Explore good blog and Q&A',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: Colors.white),
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
                            color: const Color(0xff64748B),
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
                            color: const Color(0xff64748B),
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
          ),
        ),
      ),
      body: Container(
        color: const Color(0xffF7F5FF), // Set background color here
        child: Column(
          children: [
            // Custom styled content type buttons
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
              
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: contentTypes.asMap().entries.map((entry) {
                  int index = entry.key;
                  String tab = entry.value;
                  bool isSelected = index == selectedContentTypeIndex;
        
                  return GestureDetector(
                    onTap: () {
                      _onContentTypeSelected(index);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.pinkAccent.shade100
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        tab,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
        
            // Full-width category buttons with icons
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: SizedBox(
                height: 30,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: categories.map((category) {
                      int index = categories.indexOf(category);
                      return GestureDetector(
                        onTap: () => _onCategorySelected(index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                            color: selectedCategoryIndex == index
                                ? const Color(0xffF49EC4)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: selectedCategoryIndex == index
                                ? Border.all(color: const Color(0xffF49EC4), width: 1.5)
                                : Border.all(color: Colors.grey[300]!),
                          ),
                          child: Text(
                            category,
                            style: TextStyle(
                              color: selectedCategoryIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
        
            const SizedBox(height: 10),
        
            // Display different content based on selected content type
            Expanded(
              child: SingleChildScrollView(
                child: getContentWidget()
                ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Define the action for the FAB
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Action'),
                content: const Text('Floating Action Button Pressed!'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        backgroundColor: const Color(0xffF49EC4), // Customize the color
        child: SvgPicture.asset(
          "assets/icon/ask.svg",
          width: 60,
          height: 60,
          color: Colors.white,
        ), // Icon of the FAB

        // Make the FAB rounded with a specific shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Set the corner radius here
        ),
      ),
    );
  }
}
