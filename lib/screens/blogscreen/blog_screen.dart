import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final List<String> contentTypes = ["All", "Q&A", "Blog", "Videos", "My Post"];
  final List<String> categories = [
    "",
    "Sexual Health",
    "Menstrual Health",
    "Pregnancy",
    "Contraception"
  ];

  int selectedContentTypeIndex = 0;
  int selectedCategoryIndex = 0;

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

  // Mocked YouTube video data filtered by selected category
  List<Map<String, String>> getFilteredVideos() {
    return [
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
    ].where((video) => video['category'] == categories[selectedCategoryIndex]).toList();
  }

  // Mocked blog data filtered by selected category
  List<Map<String, String>> getFilteredBlogs() {
    return [
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
    ].where((blog) => blog['category'] == categories[selectedCategoryIndex]).toList();
  }

  // Mocked Q&A data filtered by selected category
  List<Map<String, String>> getFilteredQA() {
    return [
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
    ].where((qa) => qa['category'] == categories[selectedCategoryIndex]).toList();
  }

  // Widget to display YouTube videos
  Widget buildVideoWidget() {
    List<Map<String, String>> videos = getFilteredVideos();
    return ListView.builder(
      itemCount: videos.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        String? videoId = YoutubePlayer.convertUrlToId(videos[index]['videoUrl']!);

        if (videoId == null) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: const Text(
              'Invalid video URL',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          );
        }

        YoutubePlayerController _controller = YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        );

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YoutubePlayer(
                controller: _controller,
                showVideoProgressIndicator: true,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  videos[index]['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Divider(thickness: 1, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // Action for "See more" button
                    },
                    child: const Text('See more detail', textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget for Blogs
  Widget buildBlogWidget() {
    return ListView.builder(
      itemCount: getFilteredBlogs().length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final blog = getFilteredBlogs()[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(blog['image']!),
                ),
                title: Text(blog['poster']!),
                subtitle: Text(blog['date']!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  blog['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    const Icon(Icons.comment, size: 16),
                    const SizedBox(width: 4),
                    Text('12'),
                    const SizedBox(width: 16),
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 4),
                    Text('2 doctor answered'),
                    const SizedBox(width: 16),
                    const Icon(Icons.remove_red_eye, size: 16),
                    const SizedBox(width: 4),
                    Text('234 views'),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(thickness: 1, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        // See more action
                      },
                      child: const Text('See more detail', textAlign: TextAlign.center),
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

  // Widget for Q&A
  Widget buildQandAWidget() {
    return ListView.builder(
      itemCount: getFilteredQA().length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final qa = getFilteredQA()[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(qa['profileImage']!),
                ),
                title: Text(qa['poster']!),
                subtitle: Text(qa['date']!),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  qa['question']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.comment, size: 16),
                    const SizedBox(width: 4),
                    Text(qa['comments']!),
                    const SizedBox(width: 16),
                    const Icon(Icons.person, size: 16),
                    const SizedBox(width: 4),
                    Text(qa['answers']!),
                    const SizedBox(width: 10),
                    const Icon(Icons.elderly_rounded, size: 16),
                    Text(qa['view']!),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(thickness: 1, color: Colors.grey),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Center(
                  child: TextButton(
                    onPressed: () {
                      // See more action
                    },
                    child: const Text('See more detail', textAlign: TextAlign.center),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // Widget to display both Blog, Q&A, and Video mixed (for All content)
  Widget buildAllContentWidget() {
    return Column(
      children: [
        buildVideoWidget(), // Shows YouTube videos
        buildBlogWidget(), // Shows blogs
        buildQandAWidget(), // Shows Q&A
      ],
    );
  }

  // Widget to display content based on content type
  Widget getContentWidget() {
    if (selectedContentTypeIndex == 0) {
      return buildAllContentWidget(); // If "All" is selected
    } else if (selectedContentTypeIndex == 1) {
      return buildBlogWidget(); // If "Blog" is selected
    } else if (selectedContentTypeIndex == 2) {
      return buildQandAWidget(); // If "Q&A" is selected
    } else if (selectedContentTypeIndex == 3) {
      return buildVideoWidget(); // If "Video" is selected
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
                          .headlineMedium
                          ?.copyWith(color: Colors.black),
                    ),
                    Text(
                      'Explore good blog and Q&A',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
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
        ),
      ),
      body: Container(
        color: const Color(0xffF7F5FF), // Set background color here
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Custom styled content type buttons
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30), // Rounded container
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
                            color: isSelected ? Colors.black : Colors.grey,
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
                padding: const EdgeInsets.all(8.0),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (index == 0)
                                  const Icon(Icons.sort,
                                      size: 16, color: Colors.black),
                                const SizedBox(width: 4),
                                Text(
                                  category,
                                  style: TextStyle(
                                    color: selectedCategoryIndex == index
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Display different content based on selected content type
              getContentWidget(),
            ],
          ),
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
          width: 40,
          height: 40,
        ), // Icon of the FAB

        // Make the FAB rounded with a specific shape
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Set the corner radius here
        ),
      ),
    );
  }
}
